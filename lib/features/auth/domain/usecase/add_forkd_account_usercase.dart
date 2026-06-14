import 'package:equatable/equatable.dart';
import 'package:forkd/core/usecase/usecase.dart';
import 'package:forkd/features/auth/data/models/token.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class AddForkdAccountUsercase extends UseCase<void, AddForkdAccountParams> {
  AddForkdAccountUsercase({required this.forkdAuthRepo});
  final ForkdAuthRepo forkdAuthRepo;

  @override
  Future<Either<Exception, void>> call(AddForkdAccountParams params) async {
    return forkdAuthRepo.addAccount(params.account, params.token);
  }
}

class AddForkdAccountParams extends Equatable {
  const AddForkdAccountParams({required this.account, required this.token});

  final AccountEntity account;
  final TokenModel token;
  @override
  List<Object?> get props => [account, token];
}
