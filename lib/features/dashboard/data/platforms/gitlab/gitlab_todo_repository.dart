import 'package:dio/dio.dart';
import 'package:forkd/core/networking/networking_helpers.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/features/dashboard/domain/entities/todo_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/todo_repository.dart';
import 'package:logger/logger.dart';

/// Real GitLab REST API v4 backed implementation of [TodoRepository].
///
/// Resolves the active account, points the shared [Dio] at the account's
/// domain (so the auth interceptor attaches the bearer token and handles
/// 401 token refresh), then calls `GET /api/v4/todos`.
class GitlabTodoRepository implements TodoRepository {
  const GitlabTodoRepository({
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
  Future<List<TodoEntity>> fetch() async {
    final account = await accountsService.getActiveAccount;
    if (account == null) {
      throw Exception('No active GitLab account. Add an account first.');
    }

    NetworkingHelpers.configureDio(domain: account.domain);
    _logger?.d('Fetching todos from ${account.domain}');

    final items = await NetworkingHelpers.getAllPages(
      _client,
      '$_basePath/todos',
      {'state': 'pending'},
    );

    return items.map(fromMap).toList();
  }

  @override
  Future<void> markDone(int id) async {
    final account = await accountsService.getActiveAccount;
    if (account == null) {
      throw Exception('No active GitLab account. Add an account first.');
    }

    NetworkingHelpers.configureDio(domain: account.domain);
    final response = await _client.post<dynamic>(
      '$_basePath/todos/$id/mark_as_done',
    );
    _ensureOk(response);
  }

  static void _ensureOk(Response<dynamic> response) {
    if (response.statusCode == null || response.statusCode! >= 400) {
      throw Exception(
        'GitLab API error ${response.statusCode}: ${response.data}',
      );
    }
  }

  /// Maps a single GitLab todo JSON object to a domain entity.
  ///
  /// Public so the mapping can be tested without Dio/DI.
  static TodoEntity fromMap(Map<String, dynamic> item) {
    final target =
        (item['target'] as Map?)?.cast<String, dynamic>() ?? const {};
    final author = (item['author'] as Map?)?.cast<String, dynamic>();
    final action = _mapAction(item['action_name'] as String?);

    return TodoEntity(
      id: (item['id'] as num).toInt(),
      action: action,
      targetType: (item['target_type'] as String?) == 'MergeRequest'
          ? TodoTargetType.mergeRequest
          : TodoTargetType.issue,
      title: target['title'] as String? ?? '',
      projectPath:
          _projectPath(item['project']) ?? 'project_${item['project_id']}',
      iid: (target['iid'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(item['created_at'] as String),
      authorName: action.isSystem ? null : author?['name'] as String?,
    );
  }

  /// `project.path_with_namespace`, falling back to the target's full ref
  /// (`acme/payments-api!482` -> `acme/payments-api`).
  static String? _projectPath(Object? project) {
    if (project is Map && project['path_with_namespace'] is String) {
      return project['path_with_namespace'] as String;
    }
    return null;
  }

  static TodoAction _mapAction(String? raw) => switch (raw) {
    'assigned' => TodoAction.assigned,
    'review_requested' => TodoAction.reviewRequested,
    'mentioned' || 'directly_addressed' => TodoAction.mentioned,
    'approval_required' => TodoAction.approvalRequired,
    'build_failed' || 'unmergeable' => TodoAction.pipelineFailed,
    _ => TodoAction.other,
  };
}
