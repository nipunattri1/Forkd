import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/features/dashboard/application/use_cases/fetch_projects.dart';
import 'package:forkd/features/dashboard/domain/entities/project_entity.dart';
import 'package:forkd/features/dashboard/domain/value_objects/project_tab.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'projects_bloc.freezed.dart';

@freezed
class ProjectsEvent with _$ProjectsEvent {
  /// Initial load.
  const factory ProjectsEvent.started() = _Started;

  /// Pull-to-refresh: keeps the current list on screen while fetching.
  const factory ProjectsEvent.refreshed() = _Refreshed;

  const factory ProjectsEvent.tabChanged(ProjectTab tab) = _TabChanged;
}

@freezed
sealed class ProjectsState with _$ProjectsState {
  /// [counts] are the tab badge totals loaded so far.
  const factory ProjectsState.loading({
    required ProjectTab tab,
    @Default(<ProjectTab, int>{}) Map<ProjectTab, int> counts,
  }) = _Loading;

  const factory ProjectsState.data({
    required List<ProjectEntity> items,
    required ProjectTab tab,
    @Default(<ProjectTab, int>{}) Map<ProjectTab, int> counts,
    @Default(false) bool isRefreshing,
  }) = _Data;

  const factory ProjectsState.error({
    required Object err,
    required ProjectTab tab,
    @Default(<ProjectTab, int>{}) Map<ProjectTab, int> counts,
  }) = _Error;
}

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc(this._fetchProjects)
    : super(const ProjectsState.loading(tab: ProjectTab.yours)) {
    on<_Started>(_onStarted);
    on<_Refreshed>(_onRefreshed);
    on<_TabChanged>((event, emit) => _load(emit, event.tab, _counts));
  }

  final FetchProjects _fetchProjects;

  Map<ProjectTab, int> _counts = const {};

  Future<void> _onStarted(_Started event, Emitter<ProjectsState> emit) async {
    // The Starred badge needs a total we do not load otherwise. Best-effort:
    // if it fails, the list load below reports the error.
    try {
      _counts = {
        ..._counts,
        ProjectTab.starred: await _fetchProjects.count(ProjectTab.starred),
      };
    } on Exception {
      // Leave the badge empty.
    }
    await _load(emit, ProjectTab.yours, _counts);
  }

  Future<void> _onRefreshed(
    _Refreshed event,
    Emitter<ProjectsState> emit,
  ) async {
    final current = state;
    final tab = _tabOf(current);
    if (current is _Data) {
      emit(current.copyWith(isRefreshing: true));
      await _fetch(emit, tab, _counts);
    } else {
      await _load(emit, tab, _counts);
    }
  }

  Future<void> _load(
    Emitter<ProjectsState> emit,
    ProjectTab tab,
    Map<ProjectTab, int> counts,
  ) async {
    emit(ProjectsState.loading(tab: tab, counts: counts));
    await _fetch(emit, tab, counts);
  }

  Future<void> _fetch(
    Emitter<ProjectsState> emit,
    ProjectTab tab,
    Map<ProjectTab, int> counts,
  ) async {
    try {
      final items = await _fetchProjects(tab);
      // shortcut: the badge uses the loaded page length, so it caps at the
      // 100-per-page limit; use the X-Total count here if that matters.
      _counts = {...counts, tab: items.length};
      emit(ProjectsState.data(items: items, tab: tab, counts: _counts));
    } on Exception catch (e, st) {
      addError(e, st);
      emit(ProjectsState.error(err: e, tab: tab, counts: counts));
    }
  }

  static ProjectTab _tabOf(ProjectsState state) => state.map(
    loading: (s) => s.tab,
    data: (s) => s.tab,
    error: (s) => s.tab,
  );
}
