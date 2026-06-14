import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_counts.freezed.dart';
part 'user_counts.g.dart';

@Freezed(unionKey: 'platformType')
sealed class UserCounts with _$UserCounts {
  const UserCounts._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory UserCounts.gitlab({
    required int mergeRequests,
    required int assignedIssues,
    required int assignedMergeRequests,
    required int reviewRequestedMergeRequests,
    required int todos,
  }) = _GitlabUserCounts;

  factory UserCounts.fromJson(Map<String, dynamic> json) =>
      _$UserCountsFromJson(json);
}
