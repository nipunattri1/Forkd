import 'package:dio/dio.dart';
import 'package:forkd/core/networking/networking_helpers.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/features/dashboard/domain/entities/project_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/project_repository.dart';
import 'package:forkd/features/dashboard/domain/value_objects/project_tab.dart';
import 'package:logger/logger.dart';

/// Real GitLab REST API v4 backed implementation of [ProjectRepository].
///
/// Resolves the active account, points the shared [Dio] at the account's
/// domain (so the auth interceptor attaches the bearer token), then calls
/// `GET /api/v4/projects`.
class GitlabProjectRepository implements ProjectRepository {
  const GitlabProjectRepository({
    required this.accountsService,
    this._dio,
    this._logger,
  });

  final ForkdAccountsDataSource accountsService;
  final Dio? _dio;
  final Logger? _logger;

  Dio get _client => _dio ?? di<Dio>();

  static const _basePath = '/api/v4';

  @override
  Future<List<ProjectEntity>> fetch(ProjectTab tab) async {
    final client = await _prepare(tab);
    // Explore is every visible project on the instance: downloading every page
    // can be huge and crash the app. Only the first page (top by stars) is
    // needed for browsing.
    final List<Map<String, dynamic>> items;
    if (tab == ProjectTab.explore) {
      final response = await client.get<dynamic>(
        '$_basePath/projects',
        queryParameters: {..._query(tab), 'per_page': 100},
      );
      _ensureOk(response);
      final data = response.data;
      items = data is List ? data.cast<Map<String, dynamic>>() : const [];
    } else {
      items = await NetworkingHelpers.getAllPages(
        client,
        '$_basePath/projects',
        _query(tab),
      );
    }
    return items.map(fromMap).toList();
  }

  @override
  Future<int> count(ProjectTab tab) async {
    final client = await _prepare(tab);
    final response = await client.get<dynamic>(
      '$_basePath/projects',
      queryParameters: {..._query(tab), 'per_page': 1},
    );
    _ensureOk(response);
    return int.tryParse(response.headers.value('x-total') ?? '') ?? 0;
  }

  /// Resolves the active account, points the shared [Dio] at its domain and
  /// returns the client to use.
  Future<Dio> _prepare(ProjectTab tab) async {
    final account = await accountsService.getActiveAccount;
    if (account == null) {
      throw Exception('No active GitLab account. Add an account first.');
    }

    NetworkingHelpers.configureDio(domain: account.domain);
    _logger?.d('Fetching ${tab.label} projects from ${account.domain}');
    return _client;
  }

  static Map<String, dynamic> _query(ProjectTab tab) => {
    ...mapTab(tab),
    'order_by': tab == ProjectTab.explore ? 'star_count' : 'last_activity_at',
    'sort': 'desc',
  };

  /// The `GET /projects` filter selecting [tab]: the user's starred projects,
  /// their memberships, or every visible public project (no filter).
  static Map<String, dynamic> mapTab(ProjectTab tab) => switch (tab) {
    ProjectTab.starred => {'starred': true},
    ProjectTab.yours => {'membership': true},
    ProjectTab.explore => const {},
  };

  static void _ensureOk(Response<dynamic> response) {
    if (response.statusCode == null || response.statusCode! >= 400) {
      throw Exception(
        'GitLab API error ${response.statusCode}: ${response.data}',
      );
    }
  }

  /// Maps a single GitLab project JSON object to a domain entity.
  ///
  /// Public so the mapping can be tested without Dio/DI.
  static ProjectEntity fromMap(Map<String, dynamic> item) {
    final path = item['path_with_namespace'] as String? ?? '';
    final rawNamespace = item['namespace'];
    final namespace = rawNamespace is Map
        ? rawNamespace.cast<String, dynamic>()
        : null;

    return ProjectEntity(
      path: path,
      name: item['name'] as String? ?? path.split('/').last,
      namespace: namespace?['path'] as String? ?? _namespaceOf(path),
      description: item['description'] as String? ?? '',
      visibility: item['visibility'] as String? ?? 'public',
      stars: (item['star_count'] as num?)?.toInt() ?? 0,
      forks: (item['forks_count'] as num?)?.toInt() ?? 0,
      openIssues: (item['open_issues_count'] as num?)?.toInt() ?? 0,
      updatedAt:
          DateTime.tryParse(item['last_activity_at'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }

  /// `acme/payments-api` -> `acme`; `payments-api` -> ``.
  static String _namespaceOf(String path) {
    final i = path.lastIndexOf('/');
    return i < 0 ? '' : path.substring(0, i);
  }
}
