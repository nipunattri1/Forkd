import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/features/dashboard/application/use_cases/fetch_pipelines.dart';
import 'package:forkd/features/dashboard/domain/entities/pipeline_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pipelines_bloc.freezed.dart';

@freezed
class PipelinesEvent with _$PipelinesEvent {
  /// Initial load.
  const factory PipelinesEvent.started() = _Started;

  /// Pull-to-refresh: keeps the current list on screen while fetching.
  const factory PipelinesEvent.refreshed() = _Refreshed;
}

@freezed
sealed class PipelinesState with _$PipelinesState {
  const factory PipelinesState.loading() = _Loading;

  /// [isRefreshing] is true while a pull-to-refresh is in flight, so a refresh
  /// always emits a change even when the list is unchanged.
  const factory PipelinesState.data({
    required List<PipelineEntity> items,
    @Default(false) bool isRefreshing,
  }) = _Data;

  const factory PipelinesState.error({required Object err}) = _Error;
}

class PipelinesBloc extends Bloc<PipelinesEvent, PipelinesState> {
  PipelinesBloc(this._fetchPipelines) : super(const PipelinesState.loading()) {
    on<_Started>((event, emit) => _load(emit));
    on<_Refreshed>(_onRefreshed);
  }

  final FetchPipelines _fetchPipelines;

  Future<void> _load(Emitter<PipelinesState> emit) async {
    emit(const PipelinesState.loading());
    await _fetch(emit);
  }

  Future<void> _onRefreshed(
    _Refreshed event,
    Emitter<PipelinesState> emit,
  ) async {
    final current = state;
    if (current is _Data) {
      emit(current.copyWith(isRefreshing: true));
      await _fetch(emit);
    } else {
      await _load(emit);
    }
  }

  Future<void> _fetch(Emitter<PipelinesState> emit) async {
    try {
      final items = await _fetchPipelines();
      emit(PipelinesState.data(items: items));
    } on Exception catch (e, st) {
      addError(e, st);
      emit(PipelinesState.error(err: e));
    }
  }
}
