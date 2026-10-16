import 'package:dio/dio.dart';
import 'package:forkd/core/networking/networking_helpers.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/merge_request_repository.dart';
import 'package:forkd/features/dashboard/domain/value_objects/merge_request_filter.dart';
import 'package:logger/logger.dart';

/// Real GitLab REST API v4 backed implementation of [MergeRequestRepository].
///
/// Resolves the active account, points the shared [Dio] at the account's
/// domain (so the auth interceptor attaches the bearer token and handles
/// 401 token refresh), then calls `GET /api/v4/merge_requests`.
class GitlabMergeRequestRepository implements MergeRequestRepository {
  const GitlabMergeRequestRepository({
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
  Future<List<MergeRequestEntity>> fetch(MergeRequestFilter filter) async {
    final account = await accountsService.getActiveAccount;
    if (account == null) {
      throw Exception(
        'No active GitLab account. Add an account first.',
      );
    }

    NetworkingHelpers.configureDio(domain: account.domain);
    _logger?.d('Fetching merge requests from ${account.domain}');

    final response = await _client.get<dynamic>(
      '$_basePath/merge_requests',
      queryParameters: {
        'scope': mapScope(filter.scope),
        'state': mapState(filter.status),
        'order_by': mapSort(filter.sort),
        'sort': 'desc',
        'per_page': 100,
      },
    );

    if (response.statusCode == null || response.statusCode! >= 400) {
      throw Exception(
        'GitLab API error ${response.statusCode}: ${response.data}',
      );
    }

    final list = response.data as List;
    return list.cast<Map<String, dynamic>>().map(fromMap).toList();
  }

  /// Maps a single GitLab merge request JSON object to a domain entity.
  ///
  /// Public so the mapping can be tested without Dio/DI.
  static MergeRequestEntity fromMap(Map<String, dynamic> item) {
    final labels = <MrLabelEntity>[];
    final rawLabels = item['labels'];
    if (rawLabels is List) {
      for (final raw in rawLabels) {
        final name = raw is Map<String, dynamic>
            ? raw['name']?.toString()
            : raw.toString();
        if (name != null && name.isNotEmpty) {
          labels.add(MrLabelEntity(name));
        }
      }
    }

    final project = item['project'];
    final projectPath = (project is Map<String, dynamic>
        ? (project['path_with_namespace'] ??
            project['name'] ??
            'project_${item['project_id'] ?? item['id']}')
        : 'project_${item['project_id'] ?? item['id']}') as String;

    return MergeRequestEntity(
      projectPath: projectPath,
      iid: (item['iid'] as num).toInt(),
      updatedAt: DateTime.parse(item['updated_at'] as String),
      title: item['title'] as String? ?? '',
      sourceBranch: item['source_branch'] as String? ?? '',
      targetBranch: item['target_branch'] as String? ?? '',
      pipeline: _mapPipeline(item['detailed_merge_status']),
      comments: (item['user_notes_count'] as num?)?.toInt() ?? 0,
      approvals: 0,
      approvalsRequired: (item['approvals_before_merge'] as num?)?.toInt() ?? 0,
      labels: labels,
    );
  }

  static String mapScope(MrScope scope) => switch (scope) {
        MrScope.assignedToYou => 'assigned_to_me',
        MrScope.reviewRequested => 'review_requested',
        MrScope.createdByYou => 'created_by_me',
      };

  static String mapState(MrStatus status) => switch (status) {
        MrStatus.opened => 'opened',
        MrStatus.closed => 'closed',
        MrStatus.merged => 'merged',
        MrStatus.all => 'all',
      };

  static String mapSort(MrSort sort) => switch (sort) {
        MrSort.updated => 'updated_at',
        MrSort.created => 'created_at',
      };

  static PipelineStatus _mapPipeline(Object? status) {
    final s = (status ?? '').toString().toLowerCase();
    return switch (s) {
      'unblocked' || 'ready' => PipelineStatus.success,
      'blocked' ||
          'cannot_be_merged' ||
          'cannot_be_merged_will_be_blocked' ||
          'marked_as_blocked' ||
          'cannot_be_merged_without_ci' => PipelineStatus.failed,
      'manual' => PipelineStatus.manual,
      _ => PipelineStatus.running,
    };
  }
}
