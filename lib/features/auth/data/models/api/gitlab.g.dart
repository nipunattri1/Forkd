// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gitlab.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiGitlabUser _$ApiGitlabUserFromJson(Map<String, dynamic> json) =>
    ApiGitlabUser()
      ..id = (json['id'] as num?)?.toInt()
      ..username = json['username'] as String?
      ..name = json['name'] as String?
      ..avatarUrl = json['avatar_url'] as String?
      ..bio = json['bio'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..accessLevel = (json['access_level'] as num?)?.toInt();

Map<String, dynamic> _$ApiGitlabUserToJson(ApiGitlabUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
      'bio': instance.bio,
      'created_at': instance.createdAt?.toIso8601String(),
      'access_level': instance.accessLevel,
    };
