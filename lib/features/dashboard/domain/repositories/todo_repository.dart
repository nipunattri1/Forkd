import 'package:forkd/features/dashboard/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  /// Pending todos for the current account. Throws on failure; the bloc turns
  /// that into an error state.
  Future<List<TodoEntity>> fetch();

  /// Marks the todo with [id] as done on the server.
  Future<void> markDone(int id);
}
