import 'package:forkd/features/dashboard/presentation/mappers/merge_request_presenter.dart';

/// Calendar-day bucket used to group the To-Do feed.
enum TodoGroup { today, yesterday, earlier }

extension TodoGroupLabel on TodoGroup {
  String get label => switch (this) {
    TodoGroup.today => 'Today',
    TodoGroup.yesterday => 'Yesterday',
    TodoGroup.earlier => 'Earlier',
  };
}

/// Which day bucket [time] falls in, relative to [now].
TodoGroup todoGroupFor(DateTime time, {DateTime? now}) {
  final today = _day(now ?? DateTime.now());
  final diff = today.difference(_day(time)).inDays;
  if (diff <= 0) return TodoGroup.today;
  if (diff == 1) return TodoGroup.yesterday;
  return TodoGroup.earlier;
}

DateTime _day(DateTime t) => DateTime(t.year, t.month, t.day);

/// The trailing time label of a todo row: relative within today, `Yesterday`
/// for the yesterday bucket (matching the group header), days for older.
String todoTimeLabel(DateTime time, {DateTime? now}) {
  final n = now ?? DateTime.now();
  return switch (todoGroupFor(time, now: n)) {
    TodoGroup.today => relativeTime(time, now: n),
    TodoGroup.yesterday => 'Yesterday',
    TodoGroup.earlier => relativeTime(time, now: n),
  };
}

/// Initials from a display name (`Priya Nair` -> `PN`).
String initialsFor(String name) {
  final parts = name
      .trim()
      .split(RegExp(r'\s+'))
      .where((p) => p.isNotEmpty)
      .toList();
  if (parts.isEmpty) return '?';
  if (parts.length == 1) {
    final p = parts.first;
    return p.substring(0, p.length < 2 ? p.length : 2).toUpperCase();
  }
  return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
}
