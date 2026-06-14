import 'package:json_annotation/json_annotation.dart';

part 'gitlab.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiGitlabUser {
  ApiGitlabUser();
  factory ApiGitlabUser.fromJson(Map<String, dynamic> json) =>
      _$ApiGitlabUserFromJson(json);

  Map<String, dynamic> toJson() => _$ApiGitlabUserToJson(this);
  int? id;
  String? username;
  String? name;
  String? avatarUrl;
  String? bio;
  DateTime? createdAt;
  int? accessLevel;
}
