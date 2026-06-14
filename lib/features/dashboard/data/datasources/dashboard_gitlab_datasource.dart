import 'package:dio/dio.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/dashboard/data/models/user_counts.dart';
import 'package:forkd/features/dashboard/utils/constants.dart';
import 'package:fpdart/fpdart.dart';

class DashboardGitlabDatasource {
  Future<Either<Exception, UserCounts>> getUserCounts() async {
    final res = await di<Dio>().get<Map<String, dynamic>>(
      gitlabUserMetricsPath,
    );
    if (res.statusCode == 200 && res.data != null) {
      return right(UserCounts.fromJson(res.data!));
    } else {
      return left(Exception(res.statusMessage));
    }
  }
}
