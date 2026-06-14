import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/core/services/forkd_token.dart';
import 'package:forkd/features/auth/data/models/token.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class ForkdAuthRepoImp implements ForkdAuthRepo {
  ForkdAuthRepoImp({
    required this.accountsDataSource,
    required this.tokenDataSource,
  });

  final ForkdAccountsDataSource accountsDataSource;
  final ForkdTokenService tokenDataSource;

  @override
  Future<Either<Exception, void>> addAccount(
    AccountEntity account,
    TokenModel token,
  ) => accountsDataSource.addAccount(account, token);

  @override
  Future<AccountEntity?> get getActiveAccount =>
      accountsDataSource.getActiveAccount;

  @override
  Future<List<AccountEntity>> get getallAccounts =>
      accountsDataSource.getallAccounts;

  @override
  Future<bool> get isLoggedIn => accountsDataSource.isLogedIn;

  @override
  Future<Either<Exception, void>> removeAccount(AccountEntity account) {
    return accountsDataSource.removeAccount(account);
  }

  @override
  Future<Either<Exception, void>> setActiveAccount(AccountEntity account) =>
      accountsDataSource.setActiveAccount(account);
}
