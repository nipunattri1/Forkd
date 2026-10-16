/// UI-only derivations for merge requests (kept out of the domain layer).
enum AvatarTone { purple, blue, orange, green }

/// Stable colour per project: the same path always gets the same tone.
AvatarTone avatarToneFor(String projectPath) {
  var h = 0;
  for (final c in projectPath.codeUnits) {
    h = (h * 31 + c) & 0xFFFFFFFF;
  }
  return AvatarTone.values[(h >> 11) % AvatarTone.values.length];
}

/// First letter of the repository name (`acme/web-checkout` -> `W`).
String projectInitial(String projectPath) {
  final name = projectPath.split('/').last;
  return name.isEmpty ? '?' : name[0].toUpperCase();
}

/// `now`, `42m`, `5h`, `Yesterday`, `3d`.
String relativeTime(DateTime time, {DateTime? now}) {
  final diff = (now ?? DateTime.now()).difference(time);
  if (diff.inMinutes < 1) return 'now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m';
  if (diff.inHours < 24) return '${diff.inHours}h';
  if (diff.inHours < 48) return 'Yesterday';
  return '${diff.inDays}d';
}
