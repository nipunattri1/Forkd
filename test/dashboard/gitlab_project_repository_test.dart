import 'package:flutter_test/flutter_test.dart';
import 'package:forkd/features/dashboard/data/platforms/gitlab/gitlab_project_repository.dart';

import 'package:forkd/features/dashboard/domain/value_objects/project_tab.dart';
import 'package:forkd/features/dashboard/presentation/mappers/project_presenter.dart';

void main() {
  group('GitlabProjectRepository.fromMap', () {
    test('maps a full project object', () {
      final project = GitlabProjectRepository.fromMap({
        'path_with_namespace': 'acme/payments-api',
        'name': 'payments-api',
        'namespace': {'path': 'acme'},
        'description': 'Ledger, refunds and payouts service.',
        'visibility': 'private',
        'star_count': 12,
        'forks_count': 4,
        'open_issues_count': 9,
        'last_activity_at': '2026-10-17T07:41:00.000Z',
      });

      expect(project.path, 'acme/payments-api');
      expect(project.name, 'payments-api');
      expect(project.namespace, 'acme');
      expect(project.description, 'Ledger, refunds and payouts service.');
      expect(project.isPrivate, isTrue);
      expect(project.stars, 12);
      expect(project.forks, 4);
      expect(project.openIssues, 9);
      expect(project.updatedAt, DateTime.utc(2026, 10, 17, 7, 41));
    });

    test(
      'falls back to the path and public visibility when fields are absent',
      () {
        final project = GitlabProjectRepository.fromMap({
          'path_with_namespace': 'docs/handbook',
        });

        expect(project.name, 'handbook');
        expect(project.namespace, 'docs');
        expect(project.description, '');
        expect(project.isPrivate, isFalse);
        expect(project.stars, 0);
      },
    );

    test('leaves the namespace empty for a path without a namespace', () {
      final project = GitlabProjectRepository.fromMap({
        'path_with_namespace': 'handbook',
      });

      expect(project.namespace, '');
      expect(project.name, 'handbook');
    });
  });

  group('GitlabProjectRepository.mapTab', () {
    test('selects starred, membership or every project', () {
      expect(
        GitlabProjectRepository.mapTab(ProjectTab.starred),
        {'starred': true},
      );
      expect(
        GitlabProjectRepository.mapTab(ProjectTab.yours),
        {'membership': true},
      );
      expect(GitlabProjectRepository.mapTab(ProjectTab.explore), isEmpty);
    });
  });

  group('projectUpdatedLabel', () {
    final now = DateTime(2026, 10, 17, 9, 41);

    test('uses minutes, hours and days with an ago suffix', () {
      expect(
        projectUpdatedLabel(DateTime(2026, 10, 17, 9, 39), now: now),
        'Updated 2m ago',
      );
      expect(
        projectUpdatedLabel(DateTime(2026, 10, 17, 7, 41), now: now),
        'Updated 2h ago',
      );
      expect(
        projectUpdatedLabel(DateTime(2026, 10, 14), now: now),
        'Updated 3d ago',
      );
    });
  });
}
