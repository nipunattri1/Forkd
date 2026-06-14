part of 'dashboard_bloc.dart';

@freezed
sealed class DashboardBlocEvent with _$DashboardBlocEvent {
  const factory DashboardBlocEvent.reloadData() = _LoadDataEvent;
}
