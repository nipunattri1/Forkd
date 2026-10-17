import 'package:meta/meta.dart';

/// What a todo points at — picks the `#`/`!` reference prefix.
enum TodoTargetType { issue, mergeRequest }

/// A GitLab todo action; [label] is the tail of the actor line.
enum TodoAction {
  assigned('assigned you'),
  reviewRequested('requested your review'),
  mentioned('mentioned you'),
  approvalRequired('set you as an approver'),
  pipelineFailed('Pipeline failed'),
  other('updated');

  const TodoAction(this.label);
  final String label;

  /// Failure todos render without an author, in the danger colour.
  bool get isSystem => this == pipelineFailed;
}

@immutable
class TodoEntity {
  const TodoEntity({
    required this.id,
    required this.action,
    required this.targetType,
    required this.title,
    required this.projectPath,
    required this.iid,
    required this.createdAt,
    this.authorName,
  });

  final int id;
  final TodoAction action;
  final TodoTargetType targetType;
  final String title;
  final String projectPath;
  final int iid;
  final DateTime createdAt;

  /// Null for system todos (e.g. a failed pipeline).
  final String? authorName;

  /// e.g. `acme/web-checkout · !1207` or `acme/payments-api · #311`.
  String get reference {
    final mark = targetType == TodoTargetType.mergeRequest ? '!' : '#';
    return '$projectPath · $mark$iid';
  }
}
