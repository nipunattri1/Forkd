import 'package:forkd/features/dashboard/domain/entities/project_entity.dart';
import 'package:forkd/features/dashboard/domain/value_objects/project_tab.dart';

abstract interface class ProjectRepository {
  /// Projects for [tab]. Throws on failure; the bloc turns that into an error
  /// state.
  Future<List<ProjectEntity>> fetch(ProjectTab tab);

  /// Total number of projects in [tab], used for the tab count badges. Reads
  /// GitLab's `X-Total` header so the whole list is not downloaded.
  Future<int> count(ProjectTab tab);
}
