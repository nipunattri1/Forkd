// import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/core/usecase/usecase.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';
import 'package:forkd/features/auth/domain/repositories/gitlab_auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';

class AddGitlabOAuthAccountParams {
  const AddGitlabOAuthAccountParams({this.domain = 'gitlab.com'});
  final String domain;
}

class AddGitlabOAuthAccountUseCase
    implements UseCase<void, AddGitlabOAuthAccountParams> {
  const AddGitlabOAuthAccountUseCase({
    required this.gitlabAuthRepo,
    required this.forkdAuthRepo,
    required this.logger,
  });

  final GitlabAuthRepo gitlabAuthRepo;
  final ForkdAuthRepo forkdAuthRepo;
  final Logger logger;
  @override
  Future<Either<Exception, void>> call(
    AddGitlabOAuthAccountParams params,
  ) async {
    try {
      final res = await gitlabAuthRepo.loginWithOAuth(domain: params.domain);
      if (res.isLeft()) return res;

      final (account, token) = res.getOrElse(
        (e) => throw Exception('No account'),
      );

      final local = await forkdAuthRepo.addAccount(account, token);

      if (local.isLeft()) return local;

      return right(null);
    } on Exception catch (e) {
      logger.e('un expected error in OAuth', error: e);
      return left(e);
    }
  }
}
