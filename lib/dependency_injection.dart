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
import 'package:forkd/features/dashboard/application/use_cases/fetch_merge_requests.dart';
import 'package:forkd/features/dashboard/domain/repositories/merge_request_repository.dart';
import 'package:forkd/features/dashboard/infrastructure/repositories/fake_merge_request_repository.dart';
import 'package:forkd/features/dashboard/persentation/bloc/dashboard_bloc.dart';
import 'package:forkd/features/dashboard/persentation/bloc/merge_requests_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final GetIt di = GetIt.instance;

Future<void> configureDependencies() async {
  _configureCore();

  _configureDataSources();

  _configureRepsositories();

  _configureUseCases();

  _configureBlocs();
}

void _configureBlocs() {
  di
    ..registerSingleton<AuthBloc>(
      AuthBloc(
        // addGithubAccountUseCase: di(),
        addGitlabOAuthAccountUseCase: di(),
        removeForkdAccountUseCase: di(),
        hydrateAuthUseCase: di(),
        setActiveForkdAccountUsecase: di(),
        addGitlabTokenAccountUsecase: di(),
        logger: di(),
      ),
    )
    // Factories: HomeScreen's BlocProvider creates (and closes) one per screen.
    ..registerFactory<DashboardBloc>(DashboardBloc.new)
    ..registerFactory<MergeRequestsBloc>(() => MergeRequestsBloc(di()));
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
  // Auth related
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
      () => FetchMergeRequests(di<MergeRequestRepository>()),
    );
}

void _configureRepsositories() {
  di
    ..registerSingleton<GitlabAuthRepo>(
      GitlabAuthRepoImp(
        gitlabDataSource: di<GitlabDataSource>(),
        logger: di<Logger>(),
      ),
    )
    ..registerSingleton<ForkdAuthRepo>(
      ForkdAuthRepoImp(
        accountsDataSource: di<ForkdAccountsDataSource>(),
        tokenDataSource: di<ForkdTokenService>(),
      ),
    )
    // di.registerSingleton<GithubAuthRepo>(
    //   GithubAuthRepoImp(
    //     dataSource: di<GithubDataSource>(),
    //     appLinks: di<AppLinks>(),
    //   ),
    // );
    ..registerLazySingleton<MergeRequestRepository>(
      () => const FakeMergeRequestRepository(),
    );
}

void _configureDataSources() {
  di
    ..registerSingleton<ForkdAccountsDataSource>(
      ForkdAccountsDataSource(tokenService: di<ForkdTokenService>()),
    )
    // di.registerSingleton<GithubDataSource>(GithubDataSource());
    ..registerSingleton<GitlabDataSource>(GitlabDataSource());
}

void _configureCore() {
  di
    ..registerSingleton<ForkdTokenService>(ForkdTokenService())
    ..registerSingleton<AppLinks>(AppLinks())
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
