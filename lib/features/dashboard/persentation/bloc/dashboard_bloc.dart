import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/core/usecase/usecase.dart';
import 'package:forkd/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:forkd/features/dashboard/domain/usecases/get_gitlab_dashboard_data_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardBlocEvent, DashboardBlocState> {
  DashboardBloc({required this.getDashboardDataUsecase})
    : super(DashboardBlocState.loading()) {
    on<_LoadDataEvent>(_doadData);
  }

  final GetDashboardDataUsecase getDashboardDataUsecase;

  Future<void> _doadData(
    _LoadDataEvent event,
    Emitter<DashboardBlocState> emit,
  ) async {
    emit(DashboardBlocState.loading());
    final val = await getDashboardDataUsecase.call(NoParams());
    print('something');
    val.fold(
      (e) => emit(DashboardBlocState.error(err: e)),
      (data) => emit(DashboardBlocState.data(data: data)),
    );
  }
}
