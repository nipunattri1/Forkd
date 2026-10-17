import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/features/dashboard/domain/entities/project_entity.dart';
import 'package:forkd/features/dashboard/presentation/widgets/project_tile.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(
    theme: ForkdTheme.dark,
    home: Scaffold(body: SizedBox(width: 390, child: child)),
  );

  testWidgets('renders a project row with namespace, name and stats', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(
        ProjectTile(
          item: ProjectEntity(
            path: 'acme/payments-api',
            name: 'payments-api',
            namespace: 'acme',
            description: 'Ledger, refunds and payouts service.',
            visibility: 'private',
            stars: 12,
            forks: 4,
            openIssues: 9,
            updatedAt: DateTime.now(),
          ),
        ),
      ),
    );

    expect(find.text('acme /'), findsOneWidget);
    expect(find.text('payments-api'), findsOneWidget);
    expect(find.text('Ledger, refunds and payouts service.'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('P'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
