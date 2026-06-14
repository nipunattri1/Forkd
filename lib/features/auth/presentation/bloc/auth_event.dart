part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.addGithubOAuthAccount() = _AddGithubAccountEvent;
  const factory AuthEvent.addGitlabOAuthAccount({required String domain}) =
      _AddGitlabOAuthAccountEvent;
  const factory AuthEvent.addGitlabTokenAccount({
    required String token,
    @Default('gitlab.com') String domain,
  }) = _AddGitlabTokenAccountEvent;

  const factory AuthEvent.hydrate() = _HydarateAuth;
  const factory AuthEvent.removeforkdAccount(AccountEntity account) =
      _RemoveForkdAccountEvent;
  const factory AuthEvent.setActiveAccount(AccountEntity account) =
      _SetActiveAccountEvent;
}
