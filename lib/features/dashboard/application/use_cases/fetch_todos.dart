import 'package:forkd/features/dashboard/domain/entities/todo_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/todo_repository.dart';

/// Loads the pending to-dos shown on the dashboard's To-Do tab.
class FetchTodos {
  const FetchTodos(this._repository);

  final TodoRepository _repository;

  Future<List<TodoEntity>> call() => _repository.fetch();
}
