import 'package:meta/meta.dart';

enum MrScope {
  assignedToYou('Assigned to you'),
  reviewRequested('Review requested'),
  createdByYou('Created by you');

  const MrScope(this.label);
  final String label;
}

enum MrStatus {
  opened('Open'),
  merged('Merged'),
  closed('Closed'),
  all('All');

  const MrStatus(this.label);
  final String label;
}

enum MrSort {
  updated('Last updated'),
  created('Created');

  const MrSort(this.label);
  final String label;
}

@immutable
class MergeRequestFilter {
  const MergeRequestFilter({
    this.scope = MrScope.assignedToYou,
    this.status = MrStatus.opened,
    this.sort = MrSort.updated,
  });

  final MrScope scope;
  final MrStatus status;
  final MrSort sort;

  /// e.g. `Assigned to you · Open`
  String get summary => '${scope.label} · ${status.label}';

  MergeRequestFilter copyWith({
    MrScope? scope,
    MrStatus? status,
    MrSort? sort,
  }) => MergeRequestFilter(
    scope: scope ?? this.scope,
    status: status ?? this.status,
    sort: sort ?? this.sort,
  );

  @override
  bool operator ==(Object other) =>
      other is MergeRequestFilter &&
      other.scope == scope &&
      other.status == status &&
      other.sort == sort;

  @override
  int get hashCode => Object.hash(scope, status, sort);
}
