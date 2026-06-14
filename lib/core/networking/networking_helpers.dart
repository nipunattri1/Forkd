import 'package:dio/dio.dart';
import 'package:forkd/core/networking/auth_interceptor.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/core/services/forkd_token.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';

class NetworkingHelpers {
  static void configureDio({required String domain}) {
    var formattedBaseUrl = domain.trim();

    if (formattedBaseUrl.startsWith('http://')) {
      formattedBaseUrl = formattedBaseUrl.replaceFirst('http://', 'https://');
    } else if (!formattedBaseUrl.startsWith('https://')) {
      formattedBaseUrl = 'https://$formattedBaseUrl';
    }

    di<Dio>()
      ..interceptors.add(
        AuthInterceptor(
          accountsService: di<ForkdAccountsDataSource>(),
          tokenService: di<ForkdTokenService>(),
          authRepo: di<ForkdAuthRepo>(),
          dio: di<Dio>(),
        ),
      )
      ..options = BaseOptions(
        baseUrl: formattedBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      );
  }
}
