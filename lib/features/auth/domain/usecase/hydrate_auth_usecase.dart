import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';

class HydrateAuthResult {
  const HydrateAuthResult({
    required this.accounts,
    required this.activeAccount,
  });

  final List<AccountEntity> accounts;
  final AccountEntity? activeAccount;
}

class HydrateAuthUseCase {
  const HydrateAuthUseCase({required this.forkdAuthRepo});
  final ForkdAuthRepo forkdAuthRepo;

  Future<HydrateAuthResult> call() async {
    final accounts = await forkdAuthRepo.getallAccounts;
    var active = await forkdAuthRepo.getActiveAccount;

    if (active == null && accounts.isNotEmpty) {
      await forkdAuthRepo.setActiveAccount(accounts[0]);
      active = accounts[0];
    }

    return HydrateAuthResult(accounts: accounts, activeAccount: active);
  }
}
