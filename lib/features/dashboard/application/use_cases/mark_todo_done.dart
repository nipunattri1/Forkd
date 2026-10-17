import 'package:forkd/features/dashboard/domain/repositories/todo_repository.dart';

/// Marks a to-do as done (the check button on a to-do row).
class MarkTodoDone {
  const MarkTodoDone(this._repository);

  final TodoRepository _repository;

  Future<void> call(int id) => _repository.markDone(id);
}
