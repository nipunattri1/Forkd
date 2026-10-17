import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_bloc.freezed.dart';

/// Which tab of the dashboard is selected.
enum DashboardSection { todo, mergeRequests, issues, pipelines }

@freezed
class DashboardEvent with _$DashboardEvent {
  /// Initial load — kept for symmetry with the other dashboard blocs.
  const factory DashboardEvent.started() = _Started;

  const factory DashboardEvent.sectionChanged(DashboardSection section) =
      _SectionChanged;
}

@freezed
sealed class DashboardState with _$DashboardState {
  const factory DashboardState.selected(DashboardSection section) = _Selected;
}

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc()
      : super(
          const DashboardState.selected(DashboardSection.todo),
        ) {
    on<_Started>((_, emit) {});
    on<_SectionChanged>(
      (event, emit) => emit(DashboardState.selected(event.section)),
    );
  }
}
