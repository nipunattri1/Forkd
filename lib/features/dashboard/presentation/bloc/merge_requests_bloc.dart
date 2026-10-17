import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/features/dashboard/application/use_cases/fetch_merge_requests.dart';
import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/domain/value_objects/merge_request_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'merge_requests_bloc.freezed.dart';

@freezed
class MergeRequestsEvent with _$MergeRequestsEvent {
  /// Initial load with the current filter.
  const factory MergeRequestsEvent.started() = _Started;

  /// Pull-to-refresh: keeps the current list on screen while fetching.
  const factory MergeRequestsEvent.refreshed() = _Refreshed;

  const factory MergeRequestsEvent.filterChanged(MergeRequestFilter filter) =
      _FilterChanged;
}

@freezed
sealed class MergeRequestsState with _$MergeRequestsState {
  const factory MergeRequestsState.loading({
    required MergeRequestFilter filter,
  }) = _Loading;

  /// [isRefreshing] is true while a pull-to-refresh is in flight. It also
  /// guarantees a refresh always emits a state change, even when the fetched
  /// list equals the current one (so `stream.firstWhere` can't hang).
  const factory MergeRequestsState.data({
    required List<MergeRequestEntity> items,
    required MergeRequestFilter filter,
    @Default(false) bool isRefreshing,
  }) = _Data;

  const factory MergeRequestsState.error({
    required Object err,
    required MergeRequestFilter filter,
  }) = _Error;
}

class MergeRequestsBloc extends Bloc<MergeRequestsEvent, MergeRequestsState> {
  MergeRequestsBloc(this._fetchMergeRequests)
    : super(const MergeRequestsState.loading(filter: MergeRequestFilter())) {
    on<_Started>((event, emit) => _load(emit, state.filter));
    on<_Refreshed>(_onRefreshed);
    on<_FilterChanged>((event, emit) => _load(emit, event.filter));
  }

  final FetchMergeRequests _fetchMergeRequests;

  Future<void> _load(
    Emitter<MergeRequestsState> emit,
    MergeRequestFilter filter,
  ) async {
    emit(MergeRequestsState.loading(filter: filter));
    await _fetch(emit, filter);
  }

  Future<void> _onRefreshed(
    _Refreshed event,
    Emitter<MergeRequestsState> emit,
  ) async {
    final current = state;
    if (current is _Data) {
      emit(current.copyWith(isRefreshing: true));
      await _fetch(emit, current.filter);
    } else {
      await _load(emit, current.filter);
    }
  }

  Future<void> _fetch(
    Emitter<MergeRequestsState> emit,
    MergeRequestFilter filter,
  ) async {
    try {
      final items = await _fetchMergeRequests(filter);
      emit(MergeRequestsState.data(items: items, filter: filter));
    } on Exception catch (e, st) {
      addError(e, st);
      emit(MergeRequestsState.error(err: e, filter: filter));
    }
  }
}
