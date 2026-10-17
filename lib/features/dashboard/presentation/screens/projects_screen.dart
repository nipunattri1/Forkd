import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/core/widgets/forkd_scaffold.dart';
import 'package:forkd/core/widgets/forkd_text_field.dart';
import 'package:forkd/features/dashboard/domain/entities/project_entity.dart';
import 'package:forkd/features/dashboard/domain/value_objects/project_tab.dart';
import 'package:forkd/features/dashboard/presentation/bloc/projects_bloc.dart';
import 'package:forkd/features/dashboard/presentation/widgets/dashboard_chrome.dart';
import 'package:forkd/features/dashboard/presentation/widgets/dashboard_states.dart';
import 'package:forkd/features/dashboard/presentation/widgets/project_tile.dart';
import 'package:material_symbols_icons/symbols.dart';

/// The Projects tab: Starred / Yours / Explore lists with a client-side name
/// filter, backed by `GET /projects`.
class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<void> _reload() async {
    context.read<ProjectsBloc>().add(const ProjectsEvent.refreshed());
    await context.read<ProjectsBloc>().stream.firstWhere(
      (s) => s.map(
        loading: (_) => false,
        error: (_) => true,
        data: (d) => !d.isRefreshing,
      ),
    );
  }

  List<ProjectEntity> _filtered(List<ProjectEntity> items) {
    final q = _search.text.trim().toLowerCase();
    if (q.isEmpty) return items;
    return items
        .where(
          (p) =>
              p.name.toLowerCase().contains(q) ||
              p.path.toLowerCase().contains(q),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        final tab = state.map(
          loading: (s) => s.tab,
          data: (s) => s.tab,
          error: (s) => s.tab,
        );
        final counts = state.map(
          loading: (s) => s.counts,
          data: (s) => s.counts,
          error: (s) => s.counts,
        );

        return ForkdScaffold(
          appabar: const _ProjectsAppBar(),
          body: Column(
            children: [
              DashboardTabs(
                selectedIndex: tab.index,
                onChanged: (i) {
                  _search.clear();
                  context.read<ProjectsBloc>().add(
                    ProjectsEvent.tabChanged(ProjectTab.values[i]),
                  );
                },
                tabs: [
                  DashboardTab(
                    'Starred',
                    count: counts[ProjectTab.starred]?.toString(),
                  ),
                  DashboardTab(
                    'Yours',
                    count: counts[ProjectTab.yours]?.toString(),
                  ),
                  const DashboardTab('Explore'),
                ],
              ),
              _SearchField(
                controller: _search,
                onChanged: (_) => setState(() {}),
                onClear: () => setState(_search.clear),
              ),
              const Divider(),
              Expanded(
                child: state.map(
                  loading: (_) => const DashboardPlaceholder(
                    child: CircularProgressIndicator(),
                  ),
                  error: (e) => RefreshIndicator(
                    onRefresh: _reload,
                    child: DashboardPlaceholder(
                      child: DashboardErrorView(
                        title: 'Failed to load projects',
                        message: e.err.toString(),
                        color: Theme.of(context).colorScheme.error,
                        onRetry: () => context.read<ProjectsBloc>().add(
                          const ProjectsEvent.started(),
                        ),
                      ),
                    ),
                  ),
                  data: (d) {
                    final items = _filtered(d.items);
                    return RefreshIndicator(
                      onRefresh: _reload,
                      child: items.isEmpty
                          ? const DashboardPlaceholder(
                              child: Text('No projects'),
                            )
                          : ListView.separated(
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: items.length,
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemBuilder: (context, i) =>
                                  ProjectTile(item: items[i], onTap: () {}),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProjectsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ProjectsAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AppBar(
      backgroundColor: scheme.surface,
      scrolledUnderElevation: 0,
      toolbarHeight: 48,
      titleSpacing: Space.lg,
      title: Text('Projects', style: dashboardTitleStyle(context)),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: Space.lg),
          child: InkWell(
            onTap: () {},
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: 36,
              height: 36,
              child: Center(
                child: Icon(Symbols.add, size: 22, color: scheme.onSurface),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;

  /// Only a change signal: the filter reads [controller] directly.
  final void Function(String?)? onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Space.lg,
        vertical: Space.sm,
      ),
      child: ForkdTextField(
        controller: controller,
        hintText: 'Filter by name',
        prefixIcon: Symbols.search,
        suffixIcon: controller.text.isEmpty ? null : Symbols.close,
        onSuffixIconTap: onClear,
        onChanged: onChanged,
      ),
    );
  }
}
