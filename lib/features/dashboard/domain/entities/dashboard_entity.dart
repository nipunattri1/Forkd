class DashboardEntity {
  DashboardEntity({
    required this.mergeRequests,
    required this.assignedIssues,
    required this.assignedMergeRequests,
    required this.reviewRequestedMergeRequests,
    required this.todos,
  });
  final int mergeRequests;
  final int assignedIssues;
  final int assignedMergeRequests;
  final int reviewRequestedMergeRequests;
  final int todos;
}
