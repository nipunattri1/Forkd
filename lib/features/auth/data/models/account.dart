import 'package:forkd/core/common/enums.dart';
import 'package:forkd/core/common/strings.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@Freezed(toJson: true)
sealed class AccountModel with _$AccountModel {
  const AccountModel._();

  factory AccountModel.github({
    required String tokenHash,
    required String login,
    required String avatarUrl,
    @Default('github.com') String domain,
  }) = GithubAccModel;

  factory AccountModel.gitee({
    required String tokenHash,
    required String login,
    required String avatarUrl,
    @Default('gitee.com') String domain,
  }) = GiteeAccModel;

  factory AccountModel.gitlab({
    required String tokenHash,
    required String username,
    required String name,
    required String avatarUrl,
    required String bio,
    required int gitlabId,
    required int? accessLevel,
    @Default('gitlab.com') String domain,
    // OAuth application id; differs per self-hosted instance.
    @Default(gitlabClientId) String clientId,
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
      GiteeAccountEntity(
        :final tokenHash,
        :final login,
        :final avatarUrl,
        :final domain,
      ) =>
        AccountModel.gitee(
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
        :final clientId,
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
          clientId: clientId,
        ),
    };
  }

  Platform get platform {
    return switch (this) {
      GitlabAccModel() => Platform.gitlab,
      GithubAccModel() => Platform.github,
      GiteeAccModel() => Platform.gitee,
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
      GiteeAccModel(
        :final tokenHash,
        :final login,
        :final avatarUrl,
        :final domain,
      ) =>
        AccountEntity.gitee(
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
        :final clientId,
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
          clientId: clientId,
        ),
    };
  }
}
