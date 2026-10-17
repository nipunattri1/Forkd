// ignore_for_file: one_member_abstracts

import 'package:forkd/features/dashboard/domain/entities/pipeline_entity.dart';

abstract interface class PipelineRepository {
  /// Fetches the pipelines triggered by the current account.
  /// Throws on failure; the bloc turns that into an error state.
  Future<List<PipelineEntity>> fetch();
}
