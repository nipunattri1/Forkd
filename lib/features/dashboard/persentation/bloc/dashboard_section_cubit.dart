import 'package:flutter_bloc/flutter_bloc.dart';

enum DashboardSection { todo, mergeRequests, issues, pipelines }

/// Which tab of the dashboard is selected.
class DashboardSectionCubit extends Cubit<DashboardSection> {
  DashboardSectionCubit() : super(DashboardSection.mergeRequests);

  void select(DashboardSection section) => emit(section);
}
