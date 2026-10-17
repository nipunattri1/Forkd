import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/features/dashboard/application/use_cases/fetch_todos.dart';
import 'package:forkd/features/dashboard/application/use_cases/mark_todo_done.dart';
import 'package:forkd/features/dashboard/domain/entities/todo_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todos_bloc.freezed.dart';

@freezed
class TodosEvent with _$TodosEvent {
  /// Initial load.
  const factory TodosEvent.started() = _Started;

  /// Pull-to-refresh: keeps the current list on screen while fetching.
  const factory TodosEvent.refreshed() = _Refreshed;

  const factory TodosEvent.markedDone(int id) = _MarkedDone;
}

@freezed
sealed class TodosState with _$TodosState {
  const factory TodosState.loading() = _Loading;

  /// [isRefreshing] is true while a pull-to-refresh is in flight, so a refresh
  /// always emits a change even when the list is unchanged.
  const factory TodosState.data({
    required List<TodoEntity> items,
    @Default(false) bool isRefreshing,
  }) = _Data;

  const factory TodosState.error({required Object err}) = _Error;
}

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc(this._fetchTodos, this._markDone)
    : super(const TodosState.loading()) {
    on<_Started>((event, emit) => _load(emit));
    on<_Refreshed>(_onRefreshed);
    on<_MarkedDone>(_onMarkedDone);
  }

  final FetchTodos _fetchTodos;
  final MarkTodoDone _markDone;

  Future<void> _load(Emitter<TodosState> emit) async {
    emit(const TodosState.loading());
    await _fetch(emit);
  }

  Future<void> _onRefreshed(
    _Refreshed event,
    Emitter<TodosState> emit,
  ) async {
    final current = state;
    if (current is _Data) {
      emit(current.copyWith(isRefreshing: true));
      await _fetch(emit);
    } else {
      await _load(emit);
    }
  }

  /// Drops the todo optimistically, then resyncs from the server on failure.
  Future<void> _onMarkedDone(
    _MarkedDone event,
    Emitter<TodosState> emit,
  ) async {
    final current = state;
    if (current is _Data) {
      emit(
        current.copyWith(
          items: current.items.where((t) => t.id != event.id).toList(),
        ),
      );
    }
    try {
      await _markDone(event.id);
    } on Exception catch (e, st) {
      addError(e, st);
      await _fetch(emit);
    }
  }

  Future<void> _fetch(Emitter<TodosState> emit) async {
    try {
      final items = await _fetchTodos();
      emit(TodosState.data(items: items));
    } on Exception catch (e, st) {
      addError(e, st);
      emit(TodosState.error(err: e));
    }
  }
}
