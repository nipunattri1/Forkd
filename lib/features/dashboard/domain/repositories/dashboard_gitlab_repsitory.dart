import 'package:forkd/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class DashboardGitlabRepsitory {
  Future<Either<Exception, DashboardEntity>> dashboardData();
}
