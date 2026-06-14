import 'package:forkd/core/usecase/usecase.dart';
import 'package:forkd/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/dashboard_gitlab_repsitory.dart';
import 'package:fpdart/fpdart.dart';

class GetDashboardDataUsecase extends UseCase<DashboardEntity, NoParams> {
  GetDashboardDataUsecase({required this.gitlabRepsitory});

  final DashboardGitlabRepsitory gitlabRepsitory;
  @override
  Future<Either<Exception, DashboardEntity>> call(NoParams params) {
    return gitlabRepsitory.dashboardData();
  }
}
