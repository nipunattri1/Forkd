import 'package:flutter_test/flutter_test.dart';

import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/domain/value_objects/merge_request_filter.dart';
import 'package:forkd/features/dashboard/infrastructure/repositories/gitlab_merge_request_repository.dart';

void main() {
  group('GitlabMergeRequestRepository.fromMap', () {
    test('maps all GitLab MR fields to domain entity', () {
      final entity = GitlabMergeRequestRepository.fromMap({
        'iid': 482,
        'project_id': 17,
        'project': {'path_with_namespace': 'acme/payments-api'},
        'title': 'Fix rounding drift in ledger totals',
        'source_branch': 'fix/ledger-rounding',
        'target_branch': 'main',
        'updated_at': '2026-10-17T10:00:00.000Z',
        'detailed_merge_status': 'unblocked',
        'user_notes_count': 6,
        'approvals_before_merge': 2,
        'labels': ['bug', {'name': 'priority', 'color': '#ff0000'}],
      });

      expect(entity.projectPath, 'acme/payments-api');
      expect(entity.iid, 482);
      expect(entity.title, 'Fix rounding drift in ledger totals');
      expect(entity.sourceBranch, 'fix/ledger-rounding');
      expect(entity.targetBranch, 'main');
      expect(entity.pipeline, PipelineStatus.success);
      expect(entity.comments, 6);
      expect(entity.approvalsRequired, 2);
      // Approvals aren't returned by the list endpoint, default to 0.
      expect(entity.approvals, 0);
      expect(entity.labels.map((l) => l.name), ['bug', 'priority']);
    });

    test('maps blocked detailed_merge_status to failed', () {
      final entity = GitlabMergeRequestRepository.fromMap({
        'iid': 1,
        'project_id': 9,
        'project': {'path_with_namespace': 'platform/infra-modules'},
        'title': 'Draft: Bump terraform',
        'source_branch': 'chore/tf',
        'target_branch': 'main',
        'updated_at': '2026-10-17T10:00:00.000Z',
        'detailed_merge_status': 'blocked',
      });
      expect(entity.pipeline, PipelineStatus.failed);
    });

    test('maps manual detailed_merge_status to manual', () {
      final entity = GitlabMergeRequestRepository.fromMap({
        'iid': 2,
        'project_id': 3,
        'project': {'path_with_namespace': 'docs/handbook'},
        'title': 'Update policy',
        'source_branch': 'docs/oncall',
        'target_branch': 'main',
        'updated_at': '2026-10-17T10:00:00.000Z',
        'detailed_merge_status': 'manual',
      });
      expect(entity.pipeline, PipelineStatus.manual);
    });

    test('falls back when project object is missing', () {
      final entity = GitlabMergeRequestRepository.fromMap({
        'iid': 1,
        'project_id': 9,
        'title': 'x',
        'source_branch': 'a',
        'target_branch': 'b',
        'updated_at': '2026-10-17T10:00:00.000Z',
        'detailed_merge_status': 'unblocked',
      });
      expect(entity.projectPath, 'project_9');
    });

    test('handles absent labels gracefully', () {
      final entity = GitlabMergeRequestRepository.fromMap({
        'iid': 1,
        'project_id': 3,
        'project': {'path_with_namespace': 'docs/handbook'},
        'title': 'x',
        'source_branch': 'a',
        'target_branch': 'b',
        'updated_at': '2026-10-17T10:00:00.000Z',
        'detailed_merge_status': 'unblocked',
      });
      expect(entity.labels, isEmpty);
    });
  });

  group('query param mapping', () {
    test('mapScope', () {
      expect(
        GitlabMergeRequestRepository.mapScope(MrScope.assignedToYou),
        'assigned_to_me',
      );
      expect(
        GitlabMergeRequestRepository.mapScope(MrScope.reviewRequested),
        'review_requested',
      );
      expect(
        GitlabMergeRequestRepository.mapScope(MrScope.createdByYou),
        'created_by_me',
      );
    });

    test('mapState', () {
      expect(
        GitlabMergeRequestRepository.mapState(MrStatus.opened),
        'opened',
      );
      expect(GitlabMergeRequestRepository.mapState(MrStatus.all), 'all');
    });

    test('mapSort', () {
      expect(
        GitlabMergeRequestRepository.mapSort(MrSort.updated),
        'updated_at',
      );
      expect(
        GitlabMergeRequestRepository.mapSort(MrSort.created),
        'created_at',
      );
    });
  });
}
