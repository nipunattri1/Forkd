import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:meta/meta.dart';

/// One CI stage of a pipeline (`build`, `test`, ...) and how it went.
@immutable
class PipelineStageEntity {
  const PipelineStageEntity(this.name, this.status);

  final String name;
  final PipelineStatus status;
}

@immutable
class PipelineEntity {
  const PipelineEntity({
    required this.id,
    required this.projectPath,
    required this.title,
    required this.ref,
    required this.status,
    required this.updatedAt,
    this.stages = const [],
    this.duration,
  });

  final int id;
  final String projectPath;

  /// The pipeline name, which GitLab defaults to the commit title.
  final String title;

  final String ref;
  final PipelineStatus status;
  final DateTime updatedAt;
  final List<PipelineStageEntity> stages;

  /// Null while the pipeline has not finished.
  final Duration? duration;
}
