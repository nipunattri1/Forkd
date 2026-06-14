part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.loading() = _AuthLoading;
  const factory AuthState.data({
    required List<AccountEntity> accounts,
    required AccountEntity? activeAccount,
  }) = _AuthData;
  const factory AuthState.error({required String error}) = _AuthError;
}
