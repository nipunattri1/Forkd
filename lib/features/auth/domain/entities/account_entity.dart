import 'package:forkd/core/common/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_entity.freezed.dart';

@freezed
sealed class AccountEntity with _$AccountEntity {
  const AccountEntity._(); // Allows us to add custom getters/methods

  const factory AccountEntity.github({
    required String tokenHash,
    required String login,
    required String avatarUrl,
    required String domain,
  }) = GithubAccountEntity;

  const factory AccountEntity.gitlab({
    required String tokenHash,
    required String username,
    required String name,
    required String avatarUrl,
    required String bio,
    required int gitlabId,
    required int? accessLevel,
    required String domain,
  }) = GitlabAccountEntity;

  // Business logic lives here safely on the entity
  Platform get platform {
    return switch (this) {
      GitlabAccountEntity() => Platform.gitlab,
      GithubAccountEntity() => throw UnimplementedError(),
    };
  }
}
