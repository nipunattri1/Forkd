import 'package:meta/meta.dart';

enum PipelineStatus { success, running, failed, manual }

/// Semantic importance of a label; mapped to a colour by the UI.
enum LabelTone { danger, info, warning, success }

/// A GitLab label. When [value] is set it is a scoped label (`scope::value`).
@immutable
class MrLabelEntity {
  const MrLabelEntity(this.name, {this.value, this.tone = LabelTone.info});

  final String name;
  final String? value;
  final LabelTone tone;
}

@immutable
class MergeRequestEntity {
  const MergeRequestEntity({
    required this.projectPath,
    required this.iid,
    required this.updatedAt,
    required this.title,
    required this.sourceBranch,
    required this.targetBranch,
    required this.pipeline,
    required this.comments,
    this.labels = const [],
  });

  final String projectPath;
  final int iid;
  final DateTime updatedAt;
  final String title;
  final String sourceBranch;
  final String targetBranch;
  final PipelineStatus pipeline;
  final int comments;
  final List<MrLabelEntity> labels;
}
