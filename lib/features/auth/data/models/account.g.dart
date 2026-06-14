// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubAccModel _$GithubAccModelFromJson(Map<String, dynamic> json) =>
    GithubAccModel(
      tokenHash: json['tokenHash'] as String,
      login: json['login'] as String,
      avatarUrl: json['avatarUrl'] as String,
      domain: json['domain'] as String? ?? 'github.com',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GithubAccModelToJson(GithubAccModel instance) =>
    <String, dynamic>{
      'tokenHash': instance.tokenHash,
      'login': instance.login,
      'avatarUrl': instance.avatarUrl,
      'domain': instance.domain,
      'runtimeType': instance.$type,
    };

GitlabAccModel _$GitlabAccModelFromJson(Map<String, dynamic> json) =>
    GitlabAccModel(
      tokenHash: json['tokenHash'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      bio: json['bio'] as String,
      gitlabId: (json['gitlabId'] as num).toInt(),
      accessLevel: (json['accessLevel'] as num?)?.toInt(),
      domain: json['domain'] as String? ?? 'gitlab.com',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GitlabAccModelToJson(GitlabAccModel instance) =>
    <String, dynamic>{
      'tokenHash': instance.tokenHash,
      'username': instance.username,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'gitlabId': instance.gitlabId,
      'accessLevel': instance.accessLevel,
      'domain': instance.domain,
      'runtimeType': instance.$type,
    };
