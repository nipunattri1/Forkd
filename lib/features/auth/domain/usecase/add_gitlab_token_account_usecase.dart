import 'package:equatable/equatable.dart';
import 'package:forkd/core/usecase/usecase.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';
import 'package:forkd/features/auth/domain/repositories/gitlab_auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class AddGitlabTokenAccountUsecase
    implements UseCase<void, AddGitlabTokenAccountParams> {
  AddGitlabTokenAccountUsecase({
    required this.gitlabAuthRepo,
    required this.forkdAuthRepo,
  });

  final GitlabAuthRepo gitlabAuthRepo;
  final ForkdAuthRepo forkdAuthRepo;
  @override
  Future<Either<Exception, void>> call(
    AddGitlabTokenAccountParams params,
  ) async {
    try {
      final acc = await gitlabAuthRepo.loginWithToken(
        token: params.token,
        domain: params.domain,
      );
      if (acc.isLeft()) return acc;

      // store token and save to forkd storage as a forkd account
      final account = acc.getOrElse((e) => throw Exception('No account'));

      await forkdAuthRepo.addAccount(account.$1, account.$2);
      return right(null);
    } on Exception catch (e, _) {
      return left(e);
    }
  }
}

class AddGitlabTokenAccountParams extends Equatable {
  const AddGitlabTokenAccountParams({
    required this.token,
    required this.domain,
  });

  final String token;
  final String domain;
  @override
  List<Object?> get props => [token, domain];
}
