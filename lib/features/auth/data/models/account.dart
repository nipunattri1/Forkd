import 'package:forkd/core/common/enums.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
sealed class AccountModel with _$AccountModel {
  // @JsonSerializable(includeIfNull: false)
  // factory AccountModel({
  //   required String platform,
  //   required String domain,
  //   required String token,
  //   required String login,
  //   required String avatarUrl,
  //   int? gitlabId, // For GitLab
  //   String? appPassword, // For Bitbucket
  //   String? accountId, // For Bitbucket
  // }) = _Account;
  const AccountModel._();

  @JsonSerializable(createToJson: true)
  factory AccountModel.github({
    required String tokenHash,
    required String login,
    required String avatarUrl,
    @Default('github.com') String domain,
  }) = GithubAccModel;

  @JsonSerializable(createToJson: true)
  factory AccountModel.gitlab({
    required String tokenHash,
    required String username,
    required String name,
    required String avatarUrl,
    required String bio,
    required int gitlabId,
    required int? accessLevel,
    @Default('gitlab.com') String domain,
  }) = GitlabAccModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  factory AccountModel.fromEntity(AccountEntity entity) {
    return switch (entity) {
      GithubAccountEntity(
        :final tokenHash,
        :final login,
        :final avatarUrl,
        :final domain,
      ) =>
        AccountModel.github(
          tokenHash: tokenHash,
          login: login,
          avatarUrl: avatarUrl,
          domain: domain,
        ),
      GitlabAccountEntity(
        :final tokenHash,
        :final username,
        :final avatarUrl,
        :final gitlabId,
        :final domain,
        :final name,
        :final accessLevel,
        :final bio,
      ) =>
        AccountModel.gitlab(
          tokenHash: tokenHash,
          username: username,
          avatarUrl: avatarUrl,
          gitlabId: gitlabId,
          domain: domain,
          name: name,
          accessLevel: accessLevel,
          bio: bio,
        ),
    };
  }

  Platform get platform {
    return switch (this) {
      GitlabAccModel() => Platform.gitlab,
      GithubAccModel() => throw UnimplementedError(),
    };
  }

  AccountEntity toEntity() {
    return switch (this) {
      GithubAccModel(
        :final tokenHash,
        :final login,
        :final avatarUrl,
        :final domain,
      ) =>
        AccountEntity.github(
          tokenHash: tokenHash,
          login: login,
          avatarUrl: avatarUrl,
          domain: domain,
        ),
      GitlabAccModel(
        :final tokenHash,
        :final username,
        :final avatarUrl,
        :final gitlabId,
        :final domain,
        :final name,
        :final accessLevel,
        :final bio,
      ) =>
        AccountEntity.gitlab(
          tokenHash: tokenHash,
          avatarUrl: avatarUrl,
          gitlabId: gitlabId,
          domain: domain,
          username: username,
          name: name,
          accessLevel: accessLevel,
          bio: bio,
        ),
    };
  }
}
