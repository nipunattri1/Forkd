import 'package:forkd/features/dashboard/presentation/mappers/merge_request_presenter.dart';

/// `4m 12s`, `1h 05m`; empty while the pipeline has no duration yet.
String formatPipelineDuration(Duration? duration) {
  if (duration == null) return '';
  if (duration.inHours > 0) {
    return '${duration.inHours}h ${(duration.inMinutes % 60).toString().padLeft(2, '0')}m';
  }
  final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  return '${duration.inMinutes}m ${seconds}s';
}

/// The tile's right-hand label: `4m 12s · 2h`.
String pipelineTimeLabel(Duration? duration, DateTime updatedAt) => [
  formatPipelineDuration(duration),
  relativeTime(updatedAt),
].where((part) => part.isNotEmpty).join(' · ');
