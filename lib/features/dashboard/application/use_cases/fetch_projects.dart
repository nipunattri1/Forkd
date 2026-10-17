import 'package:forkd/features/dashboard/domain/entities/project_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/project_repository.dart';
import 'package:forkd/features/dashboard/domain/value_objects/project_tab.dart';

/// Loads the project lists shown on the Projects screen.
class FetchProjects {
  const FetchProjects(this._repository);

  final ProjectRepository _repository;

  Future<List<ProjectEntity>> call(ProjectTab tab) => _repository.fetch(tab);

  /// The tab badge count, without downloading the whole list.
  Future<int> count(ProjectTab tab) => _repository.count(tab);
}
