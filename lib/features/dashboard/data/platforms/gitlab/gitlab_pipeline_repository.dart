import 'package:dio/dio.dart';
import 'package:forkd/core/networking/networking_helpers.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/domain/entities/pipeline_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/pipeline_repository.dart';
import 'package:logger/logger.dart';

/// Real GitLab REST API v4 backed implementation of [PipelineRepository].
///
/// Resolves the active account, points the shared [Dio] at the account's
/// domain (so the auth interceptor attaches the bearer token and handles
/// 401 token refresh), then calls `GET /api/v4/pipelines`.
class GitlabPipelineRepository implements PipelineRepository {
  const GitlabPipelineRepository({
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
  Future<List<PipelineEntity>> fetch() async {
    final account = await accountsService.getActiveAccount;
    if (account == null) {
      throw Exception('No active GitLab account. Add an account first.');
    }

    NetworkingHelpers.configureDio(domain: account.domain);
    _logger?.d('Fetching pipelines from ${account.domain}');

    final items = await NetworkingHelpers.getAllPages(
      _client,
      '$_basePath/pipelines',
      const {},
    );

    return Future.wait(items.map(_withStages));
  }

  /// Adds the pipeline's stage statuses, which the list endpoint omits.
  ///
  /// shortcut: one jobs request per pipeline (GitLab has no bulk stages
  /// endpoint), switch to GraphQL if the tab ever loads too slowly.
  Future<PipelineEntity> _withStages(Map<String, dynamic> item) async {
    try {
      final response = await _client.get<dynamic>(
        '$_basePath/projects/${item['project_id']}/pipelines/${item['id']}/jobs',
        queryParameters: const {'per_page': 100},
      );
      final jobs = (response.data as List).cast<Map<String, dynamic>>();
      return GitlabPipelineRepository.fromMap(
        item,
        stages: stagesFromJobs(jobs),
      );
    } on Exception catch (_) {
      // A pipeline whose jobs are not readable still renders without stages.
      return GitlabPipelineRepository.fromMap(item);
    }
  }

  /// Maps a single GitLab pipeline JSON object to a domain entity.
  ///
  /// Public so the mapping can be tested without Dio/DI.
  static PipelineEntity fromMap(
    Map<String, dynamic> item, {
    List<PipelineStageEntity> stages = const [],
  }) {
    final project = item['project'];
    final mergeRequest = (item['merge_request'] as Map?)
        ?.cast<String, dynamic>();
    final name = (item['name'] as String?)?.trim();
    final commitTitle = mergeRequest?['title'] as String?;
    final duration = (item['duration'] as num?)?.toInt();

    return PipelineEntity(
      id: (item['id'] as num).toInt(),
      projectPath: project is Map && project['path_with_namespace'] is String
          ? project['path_with_namespace'] as String
          : 'project_${item['project_id']}',
      title: name == null || name.isEmpty ? (commitTitle ?? '') : name,
      ref: item['ref'] as String? ?? '',
      status: mapStatus(item['status'] as String?),
      stages: stages,
      duration: duration == null ? null : Duration(seconds: duration),
      updatedAt: DateTime.parse(
        (item['updated_at'] ?? item['created_at']) as String,
      ),
    );
  }

  /// Groups jobs into their stages, keeping GitLab's stage order. A stage is
  /// as bad as its worst job.
  static List<PipelineStageEntity> stagesFromJobs(
    List<Map<String, dynamic>> jobs,
  ) {
    final order = <String>[];
    final byStage = <String, List<String>>{};
    for (final job in jobs) {
      final stage = job['stage']?.toString() ?? '';
      if (stage.isEmpty) continue;
      final statuses = byStage[stage];
      if (statuses == null) {
        byStage[stage] = [job['status']?.toString() ?? ''];
        order.add(stage);
      } else {
        statuses.add(job['status']?.toString() ?? '');
      }
    }

    return [
      for (final stage in order)
        PipelineStageEntity(stage, _worstStatus(byStage[stage]!)),
    ];
  }

  static PipelineStatus _worstStatus(List<String> statuses) {
    var worst = PipelineStatus.success;
    for (final raw in statuses) {
      final status = mapStatus(raw);
      if (_severity(status) > _severity(worst)) worst = status;
    }
    return worst;
  }

  static int _severity(PipelineStatus status) => switch (status) {
    PipelineStatus.success => 0,
    PipelineStatus.manual => 1,
    PipelineStatus.running => 2,
    PipelineStatus.failed => 3,
  };

  /// GitLab's pipeline and job statuses share a vocabulary.
  static PipelineStatus mapStatus(String? raw) =>
      switch ((raw ?? '').toLowerCase()) {
        'success' || 'skipped' => PipelineStatus.success,
        'failed' || 'canceled' => PipelineStatus.failed,
        'manual' || 'scheduled' => PipelineStatus.manual,
        _ => PipelineStatus.running,
      };
}
