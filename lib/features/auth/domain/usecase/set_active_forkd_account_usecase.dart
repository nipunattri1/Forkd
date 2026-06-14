import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class SetActiveForkdAccountUsecase {
  const SetActiveForkdAccountUsecase({required this.forkdAuthRepo});
  final ForkdAuthRepo forkdAuthRepo;

  Future<Either<Exception, void>> call(AccountEntity account) async {
    return forkdAuthRepo.setActiveAccount(account);
  }
}
