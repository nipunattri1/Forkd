import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/merge_request_repository.dart';
import 'package:forkd/features/dashboard/domain/value_objects/merge_request_filter.dart';

/// Loads the merge requests shown on the dashboard.
class FetchMergeRequests {
  const FetchMergeRequests(this._repository);

  final MergeRequestRepository _repository;

  Future<List<MergeRequestEntity>> call(MergeRequestFilter filter) =>
      _repository.fetch(filter);
}
