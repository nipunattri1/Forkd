import 'package:forkd/core/usecase/usecase.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:forkd/features/auth/domain/repositories/github_auth_repo.dart';

class AddGithubAccountUseCase extends UseCase<void, NoParams> {
  AddGithubAccountUseCase({
    required this.githubAuthRepo,
    required this.authRepo,
  });

  final GithubAuthRepo githubAuthRepo;
  final ForkdAuthRepo authRepo;

  @override
  Future<Either<Exception, void>> call(NoParams params) async {
    try {
      final res = await githubAuthRepo.loginWithOAuth();
      if (res.isLeft()) return res;

      final account = res.getOrElse((e) => throw Exception('No account'));

      await authRepo.addAccount(account.$1, account.$2);

      return right(null);
    } on Exception catch (e) {
      return left(e);
    }
  }
}
