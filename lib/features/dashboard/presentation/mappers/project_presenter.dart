/// `Updated 2h ago` / `Updated 3d ago` for a project row footer.
String projectUpdatedLabel(DateTime time, {DateTime? now}) {
  final diff = (now ?? DateTime.now()).difference(time);
  if (diff.inMinutes < 1) return 'Updated just now';
  if (diff.inMinutes < 60) return 'Updated ${diff.inMinutes}m ago';
  if (diff.inHours < 24) return 'Updated ${diff.inHours}h ago';
  return 'Updated ${diff.inDays}d ago';
}
