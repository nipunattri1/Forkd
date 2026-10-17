import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/features/dashboard/domain/entities/todo_entity.dart';
import 'package:forkd/features/dashboard/presentation/widgets/todo_tile.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(
    theme: ForkdTheme.dark,
    home: Scaffold(body: SizedBox(width: 390, child: child)),
  );

  testWidgets('renders a user to-do row', (tester) async {
    await tester.pumpWidget(
      wrap(
        TodoTile(
          item: TodoEntity(
            id: 1,
            action: TodoAction.reviewRequested,
            targetType: TodoTargetType.mergeRequest,
            title: 'Replace deprecated Stripe SDK calls',
            projectPath: 'acme/web-checkout',
            iid: 1207,
            createdAt: DateTime.now(),
            authorName: 'Priya Nair',
          ),
        ),
      ),
    );

    expect(find.text('PN'), findsOneWidget);
    expect(find.text('Priya Nair'), findsOneWidget);
    expect(find.text('requested your review'), findsOneWidget);
    expect(find.text('Replace deprecated Stripe SDK calls'), findsOneWidget);
    expect(find.text('acme/web-checkout · !1207'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('renders a system to-do row without an author', (tester) async {
    await tester.pumpWidget(
      wrap(
        TodoTile(
          item: TodoEntity(
            id: 2,
            action: TodoAction.pipelineFailed,
            targetType: TodoTargetType.mergeRequest,
            title: 'Draft: Bump terraform aws provider to 5.x',
            projectPath: 'platform/infra-modules',
            iid: 96,
            createdAt: DateTime.now(),
          ),
        ),
      ),
    );

    expect(find.text('Pipeline failed'), findsOneWidget);
    expect(find.text('platform/infra-modules · !96'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
