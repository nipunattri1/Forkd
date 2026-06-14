import 'package:forkd/features/dashboard/data/datasources/dashboard_gitlab_datasource.dart';
import 'package:forkd/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/dashboard_gitlab_repsitory.dart';
import 'package:fpdart/fpdart.dart';

class DashboardGitlabRepsitoryImp implements DashboardGitlabRepsitory {
  DashboardGitlabRepsitoryImp({required this.gitlabDatasource});

  final DashboardGitlabDatasource gitlabDatasource;
  @override
  Future<Either<Exception, DashboardEntity>> dashboardData() async {
    final val = await gitlabDatasource.getUserCounts();
    return val.fold(
      (e) => left(e),
      (data) => right(
        DashboardEntity(
          mergeRequests: data.mergeRequests,
          assignedIssues: data.assignedIssues,
          assignedMergeRequests: data.assignedMergeRequests,
          reviewRequestedMergeRequests: data.reviewRequestedMergeRequests,
          todos: data.todos,
        ),
      ),
    );
  }
}
