import 'package:app_links/app_links.dart';
import 'package:dio/dio.dart';
import 'package:forkd/core/networking/auth_interceptor.dart';
import 'package:forkd/core/services/forkd_token.dart';
import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/features/auth/data/platforms/gitlab/datasource/gitlab.dart';
import 'package:forkd/features/auth/data/platforms/gitlab/gitlab_auth_repo_imp.dart';
import 'package:forkd/features/auth/data/repostiory/forkd_auth_repo_imp.dart';
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
import 'package:forkd/features/dashboard/application/use_cases/fetch_pipelines.dart';
import 'package:forkd/features/dashboard/application/use_cases/fetch_projects.dart';
import 'package:forkd/features/dashboard/application/use_cases/fetch_todos.dart';
import 'package:forkd/features/dashboard/application/use_cases/mark_todo_done.dart';
import 'package:forkd/features/dashboard/data/platforms/gitlab/gitlab_merge_request_repository.dart';
import 'package:forkd/features/dashboard/data/platforms/gitlab/gitlab_pipeline_repository.dart';
import 'package:forkd/features/dashboard/data/platforms/gitlab/gitlab_project_repository.dart';
import 'package:forkd/features/dashboard/data/platforms/gitlab/gitlab_todo_repository.dart';
import 'package:forkd/features/dashboard/domain/repositories/merge_request_repository.dart';
import 'package:forkd/features/dashboard/domain/repositories/pipeline_repository.dart';
import 'package:forkd/features/dashboard/domain/repositories/project_repository.dart';
import 'package:forkd/features/dashboard/domain/repositories/todo_repository.dart';
import 'package:forkd/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:forkd/features/dashboard/presentation/bloc/merge_requests_bloc.dart';
import 'package:forkd/features/dashboard/presentation/bloc/pipelines_bloc.dart';
import 'package:forkd/features/dashboard/presentation/bloc/projects_bloc.dart';
import 'package:forkd/features/dashboard/presentation/bloc/todos_bloc.dart';
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
    ..registerFactory<MergeRequestsBloc>(() => MergeRequestsBloc(di()))
    ..registerFactory<TodosBloc>(() => TodosBloc(di(), di()))
    ..registerFactory<ProjectsBloc>(() => ProjectsBloc(di()))
    ..registerFactory<PipelinesBloc>(() => PipelinesBloc(di()));
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
    )
    ..registerLazySingleton(() => FetchTodos(di<TodoRepository>()))
    ..registerLazySingleton(() => MarkTodoDone(di<TodoRepository>()))
    ..registerLazySingleton(() => FetchProjects(di<ProjectRepository>()))
    ..registerLazySingleton(() => FetchPipelines(di<PipelineRepository>()));
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
      () => GitlabMergeRequestRepository(
        accountsService: di<ForkdAccountsDataSource>(),
        dio: di<Dio>(),
      ),
    )
    ..registerLazySingleton<TodoRepository>(
      () => GitlabTodoRepository(
        accountsService: di<ForkdAccountsDataSource>(),
        dio: di<Dio>(),
      ),
    )
    ..registerLazySingleton<ProjectRepository>(
      () => GitlabProjectRepository(
        accountsService: di<ForkdAccountsDataSource>(),
        dio: di<Dio>(),
      ),
    )
    ..registerLazySingleton<PipelineRepository>(
      () => GitlabPipelineRepository(
        accountsService: di<ForkdAccountsDataSource>(),
        dio: di<Dio>(),
      ),
    );

  // Attach the auth interceptor to the shared Dio once, after its
  // dependencies are registered. NetworkingHelpers.configureDio only sets
  // the base URL per request so the interceptor is never added twice.
  di<Dio>().interceptors.add(
    AuthInterceptor(
      accountsService: di<ForkdAccountsDataSource>(),
      tokenService: di<ForkdTokenService>(),
      authRepo: di<ForkdAuthRepo>(),
      dio: di<Dio>(),
    ),
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
