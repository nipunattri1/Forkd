import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';

class IsLoggedInUseCase {
  const IsLoggedInUseCase({required this.forkdAuthRepo});
  final ForkdAuthRepo forkdAuthRepo;

  Future<bool> call() async {
    return await forkdAuthRepo.isLoggedIn;
  }
}
