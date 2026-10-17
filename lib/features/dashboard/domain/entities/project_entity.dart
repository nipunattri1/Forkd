import 'package:meta/meta.dart';

/// A GitLab project as shown on the Projects screen.
@immutable
class ProjectEntity {
  const ProjectEntity({
    required this.path,
    required this.name,
    required this.namespace,
    required this.description,
    required this.visibility,
    required this.stars,
    required this.forks,
    required this.openIssues,
    required this.updatedAt,
  });

  /// `acme/payments-api`.
  final String path;
  final String name;
  final String namespace;
  final String description;

  /// GitLab's `visibility`: `public`, `internal` or `private`.
  final String visibility;
  final int stars;
  final int forks;
  final int openIssues;
  final DateTime updatedAt;

  bool get isPrivate => visibility != 'public';
}
