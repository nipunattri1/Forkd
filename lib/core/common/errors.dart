import 'package:freezed_annotation/freezed_annotation.dart';
part 'errors.freezed.dart';

class AppError {}

@freezed
sealed class NetworkError extends AppError with _$NetworkError {
  NetworkError._();
  factory NetworkError.noRefreshToken() = _NetworkNoRefreshToken;
  factory NetworkError.unknown(Exception exception) = _NetworkUnknown;
}

@freezed
sealed class AuthError extends AppError with _$AuthError {
  AuthError._();
  factory AuthError.launchError() = _AuthLaunchError;
  factory AuthError.timeout() = _AuthTimeOutError;
  factory AuthError.unknown() = _AuthUnknownError;
  factory AuthError.securityFailure() = _AuthSecurityError;
}
