part of 'dashboard_bloc.dart';

@freezed
sealed class DashboardBlocState with _$DashboardBlocState {
  const factory DashboardBlocState.loading() = _DashboardLoading;
  const factory DashboardBlocState.data({required DashboardEntity data}) =
      _DashboardData;
  const factory DashboardBlocState.error({required Exception err}) =
      _DashboardError;
}
