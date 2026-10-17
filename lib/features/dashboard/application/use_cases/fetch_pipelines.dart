import 'package:forkd/features/dashboard/domain/entities/pipeline_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/pipeline_repository.dart';

/// Loads the pipelines shown on the dashboard's Pipelines tab.
class FetchPipelines {
  const FetchPipelines(this._repository);

  final PipelineRepository _repository;

  Future<List<PipelineEntity>> call() => _repository.fetch();
}
