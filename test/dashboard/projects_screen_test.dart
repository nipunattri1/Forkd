import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/features/dashboard/application/use_cases/fetch_projects.dart';
import 'package:forkd/features/dashboard/domain/entities/project_entity.dart';
import 'package:forkd/features/dashboard/domain/repositories/project_repository.dart';
import 'package:forkd/features/dashboard/domain/value_objects/project_tab.dart';
import 'package:forkd/features/dashboard/presentation/bloc/projects_bloc.dart';
import 'package:forkd/features/dashboard/presentation/screens/projects_screen.dart';

class _FakeProjectRepository implements ProjectRepository {
  _FakeProjectRepository(this.items);

  final List<ProjectEntity> items;

  @override
  Future<List<ProjectEntity>> fetch(ProjectTab tab) async => items;

  @override
  Future<int> count(ProjectTab tab) async => items.length;
}

void main() {
  testWidgets('renders the tab strip, name filter and project rows', (
    tester,
  ) async {
    final bloc = ProjectsBloc(
      FetchProjects(
        _FakeProjectRepository([
          ProjectEntity(
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
        ]),
      ),
    )..add(const ProjectsEvent.started());
    addTearDown(bloc.close);

    await tester.pumpWidget(
      MaterialApp(
        theme: ForkdTheme.dark,
        home: BlocProvider.value(value: bloc, child: const ProjectsScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Projects'), findsOneWidget);
    expect(find.text('Starred'), findsOneWidget);
    expect(find.text('Yours'), findsOneWidget);
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Filter by name'), findsOneWidget);
    expect(find.text('payments-api'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
