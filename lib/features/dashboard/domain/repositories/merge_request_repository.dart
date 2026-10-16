// ignore_for_file: one_member_abstracts

import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/domain/value_objects/merge_request_filter.dart';

abstract interface class MergeRequestRepository {
  /// Fetches merge requests for the current account matching [filter].
  /// Throws on failure; the bloc turns that into an error state.
  Future<List<MergeRequestEntity>> fetch(MergeRequestFilter filter);
}
