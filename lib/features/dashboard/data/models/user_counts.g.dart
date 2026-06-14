// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_counts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GitlabUserCounts _$GitlabUserCountsFromJson(Map<String, dynamic> json) =>
    _GitlabUserCounts(
      mergeRequests: (json['merge_requests'] as num).toInt(),
      assignedIssues: (json['assigned_issues'] as num).toInt(),
      assignedMergeRequests: (json['assigned_merge_requests'] as num).toInt(),
      reviewRequestedMergeRequests:
          (json['review_requested_merge_requests'] as num).toInt(),
      todos: (json['todos'] as num).toInt(),
    );

Map<String, dynamic> _$GitlabUserCountsToJson(_GitlabUserCounts instance) =>
    <String, dynamic>{
      'merge_requests': instance.mergeRequests,
      'assigned_issues': instance.assignedIssues,
      'assigned_merge_requests': instance.assignedMergeRequests,
      'review_requested_merge_requests': instance.reviewRequestedMergeRequests,
      'todos': instance.todos,
    };
