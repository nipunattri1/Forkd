import 'package:app_links/app_links.dart';
import 'package:dio/dio.dart';
import 'package:forkd/core/services/forkd_token.dart';
import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/features/auth/data/datasource/gitlab.dart';
import 'package:forkd/features/auth/data/repostiory/forkd_auth_repo_imp.dart';
import 'package:forkd/features/auth/data/repostiory/gitlab_auth_repo_imp.dart';
import 'package:forkd/features/auth/domain/repositories/forkd_auth_repo.dart';
import 'package:forkd/features/auth/domain/repositories/gitlab_auth_repo.dart';
import 'package:forkd/features/auth/domain/usecase/add_forkd_account_usercase.dart';
import 'package:forkd/features/auth/domain/usecase/add_gitlab_oauth_account_usecase.dart';
import 'package:forkd/features/auth/domain/usecase/add_gitlab_token_account_usecase.dart';
import 'package:forkd/features/auth/domain/usecase/hydrate_auth_usecase.dart';
import 'package:forkd/features/auth/domain/usecase/is_logged_in_usecase.dart';
import 'package:forkd/features/auth/domain/usecase/remove_forkd_account_usecase.dart';
import 'package:forkd/features/auth/domain/usecase/set_active_forkd_account_usecase.dart';
import 'package:forkd/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:forkd/features/dashboard/data/datasources/dashboard_gitlab_datasource.dart';
import 'package:forkd/features/dashboard/data/repositories/dashboard_gitlab_repsitory_imp.dart';
import 'package:forkd/features/dashboard/domain/repositories/dashboard_gitlab_repsitory.dart';
import 'package:forkd/features/dashboard/domain/usecases/get_gitlab_dashboard_data_usecase.dart';
import 'package:forkd/features/dashboard/persentation/bloc/dashboard_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final GetIt di = GetIt.instance;

Future<void> configureDependencies() async {
  _configureCore();

  _configureDataSources();

  _configureRepsitories();

  _configureUseCases();

  _configureBlocs();
}

void _configureBlocs() {
  di.registerSingleton<AuthBloc>(
    AuthBloc(
      // addGithubAccountUseCase: di(),
      addGitlabOAuthAccountUseCase: di(),
      removeForkdAccountUseCase: di(),
      hydrateAuthUseCase: di(),
      setActiveForkdAccountUsecase: di(),
      addGitlabTokenAccountUsecase: di(),
      logger: di(),
    ),
  );
  di.registerSingleton(
    DashboardBloc(getDashboardDataUsecase: di<GetDashboardDataUsecase>()),
  );
}

void _configureUseCases() {
  // usecases, Always register lazily
  // Auth realted
  // di.registerLazySingleton(
  //   () => AddGithubAccountUseCase(
  //     githubAuthRepo: di<GithubAuthRepo>(),
  //     authRepo: di<ForkdAuthRepo>(),
  //   ),
  // );
  di
    ..registerLazySingleton(
      () => AddGitlabOAuthAccountUseCase(
        gitlabAuthRepo: di<GitlabAuthRepo>(),
        forkdAuthRepo: di<ForkdAuthRepo>(),
        logger: di<Logger>(),
      ),
    )
    ..registerLazySingleton(
      () => AddGitlabTokenAccountUsecase(
        gitlabAuthRepo: di<GitlabAuthRepo>(),
        forkdAuthRepo: di<ForkdAuthRepo>(),
      ),
    )
    ..registerLazySingleton(
      () => RemoveForkdAccountUseCase(forkdAuthRepo: di<ForkdAuthRepo>()),
    )
    ..registerLazySingleton(
      () => HydrateAuthUseCase(forkdAuthRepo: di<ForkdAuthRepo>()),
    )
    ..registerLazySingleton(
      () => AddForkdAccountUsercase(forkdAuthRepo: di<ForkdAuthRepo>()),
    )
    ..registerLazySingleton(
      () => SetActiveForkdAccountUsecase(forkdAuthRepo: di<ForkdAuthRepo>()),
    )
    ..registerLazySingleton(
      () => IsLoggedInUseCase(forkdAuthRepo: di<ForkdAuthRepo>()),
    )
    ..registerLazySingleton(
      () => GetDashboardDataUsecase(
        gitlabRepsitory: di<DashboardGitlabRepsitory>(),
      ),
    );
}

void _configureRepsitories() {
  di.registerSingleton<GitlabAuthRepo>(
    GitlabAuthRepoImp(
      gitlabDataSource: di<GitlabDataSource>(),
      logger: di<Logger>(),
    ),
  );
  // di.registerSingleton<GithubAuthRepo>(
  //   GithubAuthRepoImp(
  //     dataSource: di<GithubDataSource>(),
  //     appLinks: di<AppLinks>(),
  //   ),
  // );
  di.registerSingleton<ForkdAuthRepo>(
    ForkdAuthRepoImp(
      accountsDataSource: di<ForkdAccountsDataSource>(),
      tokenDataSource: di<ForkdTokenService>(),
    ),
  );
  di.registerSingleton<DashboardGitlabRepsitory>(
    DashboardGitlabRepsitoryImp(
      gitlabDatasource: di<DashboardGitlabDatasource>(),
    ),
  );
}

void _configureDataSources() {
  di
    ..registerSingleton<ForkdAccountsDataSource>(
      ForkdAccountsDataSource(tokenService: di<ForkdTokenService>()),
    )
    // di.registerSingleton<GithubDataSource>(GithubDataSource());
    ..registerSingleton<GitlabDataSource>(GitlabDataSource())
    ..registerSingleton<DashboardGitlabDatasource>(DashboardGitlabDatasource());
}

void _configureCore() {
  di
    ..registerSingleton<ForkdTokenService>(ForkdTokenService())
    ..registerSingleton(AppLinks())
    ..registerLazySingleton<Logger>(
      () => Logger(
        printer: PrettyPrinter(
          printEmojis: false, // Print an emoji for each log type
        ),
      ),
    )
    ..registerSingleton<Dio>(
      Dio()
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            filter: (options, args) {
              if (options.path.contains('/posts')) {
                return false;
              }
              return !args.isResponse || !args.hasUint8ListData;
            },
          ),
        ),
    );
}
