import 'package:flutter_test/flutter_test.dart';

import 'package:forkd/features/dashboard/data/platforms/gitlab/gitlab_pipeline_repository.dart';
import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/presentation/mappers/pipeline_presenter.dart';

void main() {
  group('GitlabPipelineRepository.fromMap', () {
    test('maps all GitLab pipeline fields to domain entity', () {
      final entity = GitlabPipelineRepository.fromMap({
        'id': 2094817,
        'project_id': 17,
        'project': {'path_with_namespace': 'acme/payments-api'},
        'name': 'Fix rounding drift in ledger totals',
        'ref': 'fix/ledger-rounding',
        'status': 'success',
        'duration': 252,
        'updated_at': '2026-10-17T10:00:00.000Z',
      });

      expect(entity.id, 2094817);
      expect(entity.projectPath, 'acme/payments-api');
      expect(entity.title, 'Fix rounding drift in ledger totals');
      expect(entity.ref, 'fix/ledger-rounding');
      expect(entity.status, PipelineStatus.success);
      expect(entity.duration, const Duration(seconds: 252));
    });

    test('falls back to the merge request title then to empty', () {
      final withMr = GitlabPipelineRepository.fromMap({
        'id': 1,
        'project_id': 3,
        'name': '',
        'merge_request': {'title': 'Bump terraform'},
        'ref': 'main',
        'status': 'failed',
        'updated_at': '2026-10-17T10:00:00.000Z',
      });
      expect(withMr.title, 'Bump terraform');

      final bare = GitlabPipelineRepository.fromMap({
        'id': 2,
        'project_id': 3,
        'ref': 'main',
        'status': 'running',
        'created_at': '2026-10-17T10:00:00.000Z',
      });
      expect(bare.title, isEmpty);
      expect(bare.projectPath, 'project_3');
      expect(bare.duration, isNull);
      expect(bare.status, PipelineStatus.running);
    });
  });

  group('GitlabPipelineRepository.mapStatus', () {
    test('maps GitLab statuses onto the shared enum', () {
      expect(
        GitlabPipelineRepository.mapStatus('success'),
        PipelineStatus.success,
      );
      expect(
        GitlabPipelineRepository.mapStatus('canceled'),
        PipelineStatus.failed,
      );
      expect(
        GitlabPipelineRepository.mapStatus('scheduled'),
        PipelineStatus.manual,
      );
      expect(
        GitlabPipelineRepository.mapStatus('waiting_for_resource'),
        PipelineStatus.running,
      );
      expect(GitlabPipelineRepository.mapStatus(null), PipelineStatus.running);
    });
  });

  group('GitlabPipelineRepository.stagesFromJobs', () {
    test('keeps stage order and reports the worst job status', () {
      final stages = GitlabPipelineRepository.stagesFromJobs([
        {'stage': 'build', 'status': 'success'},
        {'stage': 'test', 'status': 'success'},
        {'stage': 'test', 'status': 'failed'},
        {'stage': 'deploy', 'status': 'manual'},
      ]);

      expect(stages.map((s) => s.name), ['build', 'test', 'deploy']);
      expect(stages.map((s) => s.status), [
        PipelineStatus.success,
        PipelineStatus.failed,
        PipelineStatus.manual,
      ]);
    });

    test('ignores jobs without a stage and handles an empty list', () {
      expect(
        GitlabPipelineRepository.stagesFromJobs([
          {'status': 'success'},
        ]),
        isEmpty,
      );
      expect(GitlabPipelineRepository.stagesFromJobs([]), isEmpty);
    });
  });

  group('pipelineTimeLabel', () {
    test('pairs the duration with the relative time', () {
      final label = pipelineTimeLabel(
        const Duration(minutes: 4, seconds: 12),
        DateTime.now().subtract(const Duration(hours: 2)),
      );
      expect(label, '4m 12s · 2h');
    });

    test('pads seconds and switches to hours past an hour', () {
      expect(formatPipelineDuration(const Duration(seconds: 21)), '0m 21s');
      expect(formatPipelineDuration(const Duration(seconds: 3900)), '1h 05m');
    });

    test('shows only the relative time while the pipeline has no duration', () {
      final label = pipelineTimeLabel(
        null,
        DateTime.now().subtract(const Duration(minutes: 5)),
      );
      expect(label, '5m');
    });
  });
}
