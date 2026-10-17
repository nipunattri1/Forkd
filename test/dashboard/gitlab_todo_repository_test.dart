import 'package:flutter_test/flutter_test.dart';
import 'package:forkd/features/dashboard/data/platforms/gitlab/gitlab_todo_repository.dart';
import 'package:forkd/features/dashboard/domain/entities/todo_entity.dart';
import 'package:forkd/features/dashboard/presentation/mappers/todo_presenter.dart';

void main() {
  group('GitlabTodoRepository.fromMap', () {
    test('maps a review-request merge request todo', () {
      final todo = GitlabTodoRepository.fromMap({
        'id': 102,
        'project_id': 17,
        'project': {'path_with_namespace': 'acme/web-checkout'},
        'author': {'name': 'Priya Nair'},
        'action_name': 'review_requested',
        'target_type': 'MergeRequest',
        'target': {'iid': 1207, 'title': 'Replace deprecated Stripe SDK calls'},
        'created_at': '2026-10-17T10:00:00.000Z',
      });

      expect(todo.id, 102);
      expect(todo.authorName, 'Priya Nair');
      expect(todo.action, TodoAction.reviewRequested);
      expect(todo.targetType, TodoTargetType.mergeRequest);
      expect(todo.title, 'Replace deprecated Stripe SDK calls');
      expect(todo.projectPath, 'acme/web-checkout');
      expect(todo.iid, 1207);
      expect(todo.reference, 'acme/web-checkout · !1207');
    });

    test('maps a failed pipeline to a system todo without an author', () {
      final todo = GitlabTodoRepository.fromMap({
        'id': 7,
        'project_id': 9,
        'project': {'path_with_namespace': 'platform/infra-modules'},
        'author': {'name': 'Pipeline Bot'},
        'action_name': 'build_failed',
        'target_type': 'MergeRequest',
        'target': {'iid': 96, 'title': 'Draft: Bump terraform aws provider'},
        'created_at': '2026-10-17T10:00:00.000Z',
      });

      expect(todo.action, TodoAction.pipelineFailed);
      expect(todo.authorName, isNull);
      expect(todo.reference, 'platform/infra-modules · !96');
    });

    test('maps directly_addressed to mentioned on an issue', () {
      final todo = GitlabTodoRepository.fromMap({
        'id': 3,
        'project_id': 11,
        'project': {'path_with_namespace': 'acme/payments-api'},
        'author': {'name': 'Marcus Lee'},
        'action_name': 'directly_addressed',
        'target_type': 'Issue',
        'target': {'iid': 311, 'title': 'Rounding in ledger totals'},
        'created_at': '2026-10-17T10:00:00.000Z',
      });

      expect(todo.action, TodoAction.mentioned);
      expect(todo.targetType, TodoTargetType.issue);
      expect(todo.reference, 'acme/payments-api · #311');
    });

    test('falls back to the project id when the project object is missing', () {
      final todo = GitlabTodoRepository.fromMap({
        'id': 4,
        'project_id': 9,
        'action_name': 'assigned',
        'target_type': 'Issue',
        'target': {'iid': 1, 'title': 'x'},
        'created_at': '2026-10-17T10:00:00.000Z',
      });

      expect(todo.projectPath, 'project_9');
    });
  });

  group('todoGroupFor', () {
    final now = DateTime(2026, 10, 17, 9, 41);

    test('buckets today, yesterday and older by calendar day', () {
      expect(
        todoGroupFor(DateTime(2026, 10, 17, 9), now: now),
        TodoGroup.today,
      );
      expect(
        todoGroupFor(DateTime(2026, 10, 16, 23), now: now),
        TodoGroup.yesterday,
      );
      expect(
        todoGroupFor(DateTime(2026, 10, 14), now: now),
        TodoGroup.earlier,
      );
    });
  });

  group('initialsFor', () {
    test('uses first and last name initials', () {
      expect(initialsFor('Priya Nair'), 'PN');
      expect(initialsFor('Dana Okafor'), 'DO');
      expect(initialsFor('Marcus'), 'MA');
      expect(initialsFor('  '), '?');
    });
  });

  group('todoTimeLabel', () {
    final now = DateTime(2026, 10, 17, 9, 41);

    test('shows minutes, hours, yesterday and days', () {
      expect(todoTimeLabel(DateTime(2026, 10, 17, 9, 30), now: now), '11m');
      expect(todoTimeLabel(DateTime(2026, 10, 17, 7), now: now), '2h');
      expect(todoTimeLabel(DateTime(2026, 10, 16, 23), now: now), 'Yesterday');
      expect(todoTimeLabel(DateTime(2026, 10, 14), now: now), '3d');
    });
  });
}
