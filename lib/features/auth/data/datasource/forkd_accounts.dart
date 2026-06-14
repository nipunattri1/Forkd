import 'dart:convert';

import 'package:forkd/core/networking/networking_helpers.dart';
import 'package:forkd/core/services/forkd_token.dart';
import 'package:forkd/core/utils/utils.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/data/models/account.dart';
import 'package:forkd/features/auth/data/models/token.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForkdAccountsDataSource {
  ForkdAccountsDataSource({required this.tokenService});

  final ForkdTokenService tokenService;
  List<AccountEntity>? _inMemoryAccounts;
  AccountEntity? _inMemoryActiveAccount;

  // Retrieve the logger instance via dependency injection
  final Logger _logger = di<Logger>();

  Future<void> _saveAccountsList(List<AccountEntity> accounts) async {
    _logger.d(
      'Serializing and saving accounts list to persistent storage (${accounts.length} accounts).',
    );
    final prefs = await SharedPreferences.getInstance();
    final jsonData = accounts
        .map((account) => AccountModel.fromEntity(account).toJson())
        .toList();
    await prefs.setString(StorageKeys.accounts, json.encode(jsonData));
    _logger.d('Accounts list successfully written to disk.');
  }

  Future<void> _saveActiveAccount(AccountEntity? account) async {
    final prefs = await SharedPreferences.getInstance();
    if (account == null) {
      _logger.i('Clearing active account references from persistent storage.');
      await prefs.remove(StorageKeys.activeAccount);
    } else {
      _logger.i(
        'Saving active account to persistent storage: [Domain: ${account.domain}]',
      );
      await prefs.setString(
        StorageKeys.activeAccount,
        json.encode(AccountModel.fromEntity(account).toJson()),
      );
    }
  }

  Future<Either<Exception, void>> addAccount(
    AccountEntity account,
    TokenModel token,
  ) async {
    _logger.i(
      'Attempting to register a new account under domain: ${account.domain}',
    );

    final hash = await tokenService.addToken(token);
    if (hash.isLeft()) {
      _logger.e('Failed to process and secure the authentication token.');
      return hash;
    }

    final updatedAccount = account.copyWith(
      tokenHash: hash.getOrElse((e) => 'nullToken'),
    );
    final accounts = await getallAccounts;
    accounts.add(updatedAccount);

    try {
      await _saveAccountsList(accounts);
      _inMemoryAccounts = accounts;

      if (accounts.length == 1) {
        _logger.i(
          'First application account detected. Auto-promoting to primary active profile.',
        );
        await _saveActiveAccount(updatedAccount);
        _inMemoryActiveAccount = updatedAccount;
      }
    } on Exception catch (e) {
      _logger.e(
        'Critical failure during account ingestion/disk operations: $e',
      );
      return Either.left(e);
    }

    _logger.i(
      'Account registration successfully finalized for: ${account.domain}',
    );
    return Either.right(null);
  }

  Future<Either<Exception, void>> setActiveAccount(
    AccountEntity account,
  ) async {
    _logger.i(
      'Request received to shift active context to domain: ${account.domain}',
    );
    final accounts = await getallAccounts;
    if (accounts.contains(account)) {
      await _saveActiveAccount(account);
      _inMemoryActiveAccount = account;

      _logger.d(
        'Reconfiguring active network/Dio clients for new context domain.',
      );
      NetworkingHelpers.configureDio(domain: account.domain);
    } else {
      _logger.e(
        'Context switch rejected: Profile for target domain does not exist in local state.',
      );
      return Either.left(
        Exception('Account not found in local storage. Add it first.'),
      );
    }
    return Either.right(null);
  }

  Future<AccountEntity?> get getActiveAccount async {
    if (_inMemoryActiveAccount != null) {
      _logger.t('Active account retrieved from fast in-memory cache.');
      return _inMemoryActiveAccount;
    }

    _logger.d(
      'In-memory lookup missed. Fetching active account from SharedPreferences disk state...',
    );
    final prefs = await SharedPreferences.getInstance();
    final str = prefs.getString(StorageKeys.activeAccount);

    if (str == null || str.isEmpty) {
      _logger.d('No primary active profile is currently declared on disk.');
      return null;
    }

    try {
      final activeAccount = AccountModel.fromJson(
        json.decode(str) as Map<String, dynamic>,
      ).toEntity();
      _inMemoryActiveAccount = activeAccount;
      return activeAccount;
    } on Exception catch (err) {
      _logger.e(
        'Failed to parse active account configuration. Data might be corrupted or outdated: $err',
      );
      return null;
    }
  }

  Future<List<AccountEntity>> get getallAccounts async {
    if (_inMemoryAccounts != null) {
      _logger.t(
        'Accounts master list fetched from in-memory cache (${_inMemoryAccounts!.length} items).',
      );
      return _inMemoryAccounts!;
    }

    _logger.d(
      'In-memory lookup missed. Loading database profiles from disk storage...',
    );
    final prefs = await SharedPreferences.getInstance();

    try {
      final str = prefs.getString(StorageKeys.accounts);
      if (str == null || str.isEmpty) {
        _logger.d('No accounts found inside disk cluster database.');
        return [];
      }

      final decodedList = json.decode(str) as List<dynamic>;
      final accountsList = decodedList
          .map(
            (item) =>
                AccountModel.fromJson(item as Map<String, dynamic>).toEntity(),
          )
          .toList();

      _inMemoryAccounts = accountsList;
      _logger.d(
        'Successfully cached ${accountsList.length} application accounts into working memory.',
      );
      return accountsList;
    } on Exception catch (err) {
      _logger.e(
        'Parse failure occurred while unmarshalling master accounts list payload: $err',
      );
      return [];
    }
  }

  Future<bool> get isLogedIn async {
    final list = await getallAccounts;
    final logStatus = list.isNotEmpty;
    _logger.t(
      'Login state sanity valuation executed. Result status: $logStatus',
    );
    return logStatus;
  }

  Future<Either<Exception, void>> removeAccount(AccountEntity account) async {
    _logger.w(
      'Initiating full account termination sequence for host: ${account.domain}',
    );
    final accounts = await getallAccounts;
    final activeAccount = await getActiveAccount;

    accounts.removeWhere((element) => element == account);

    try {
      await _saveAccountsList(accounts);
      _inMemoryAccounts = accounts;

      _logger.d(
        'Purging secure credential keys map targeting token checksum hash.',
      );
      await tokenService.removeToken(account.tokenHash);

      if (activeAccount == account) {
        _logger.w(
          'The removed identity was the active primary context. Wiping operational references.',
        );
        await _saveActiveAccount(null);
        _inMemoryActiveAccount = null;
      }
    } on Exception catch (e) {
      _logger.e(
        'An error compromised the transaction workflow during profile cleanup execution: $e',
      );
      return Either.left(e);
    }

    _logger.i(
      'Account parameters cleanly expunged from device core framework storage.',
    );
    return Either.right(null);
  }
}
