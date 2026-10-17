import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/domain/entities/pipeline_entity.dart';
import 'package:forkd/features/dashboard/presentation/widgets/pipeline_tile.dart';
import 'package:material_symbols_icons/symbols.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(
    theme: ForkdTheme.dark,
    home: Scaffold(body: SizedBox(width: 390, child: child)),
  );

  testWidgets('renders a finished pipeline row with its stages', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(
        PipelineTile(
          item: PipelineEntity(
            id: 2094817,
            projectPath: 'acme/payments-api',
            title: 'Fix rounding drift in ledger totals',
            ref: 'fix/ledger-rounding',
            status: PipelineStatus.success,
            updatedAt: DateTime.now(),
            duration: const Duration(minutes: 4, seconds: 12),
            stages: const [
              PipelineStageEntity('build', PipelineStatus.success),
              PipelineStageEntity('test', PipelineStatus.success),
              PipelineStageEntity('deploy', PipelineStatus.manual),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Fix rounding drift in ledger totals'), findsOneWidget);
    expect(find.text('#2094817'), findsOneWidget);
    expect(find.text('acme/payments-api'), findsOneWidget);
    expect(find.text('fix/ledger-rounding'), findsOneWidget);
    expect(find.text('4m 12s · now'), findsOneWidget);
    expect(find.byIcon(Symbols.check_circle), findsNWidgets(3));
    expect(tester.takeException(), isNull);
  });

  testWidgets('renders a running pipeline without stages', (tester) async {
    await tester.pumpWidget(
      wrap(
        PipelineTile(
          item: PipelineEntity(
            id: 2094702,
            projectPath: 'acme/web-checkout',
            title: 'Replace deprecated Stripe SDK calls in checkout flow',
            ref: 'feat/stripe-sdk-v12',
            status: PipelineStatus.running,
            updatedAt: DateTime.now(),
          ),
        ),
      ),
    );

    expect(
      find.text('Replace deprecated Stripe SDK calls in checkout flow'),
      findsOneWidget,
    );
    expect(find.text('now'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
