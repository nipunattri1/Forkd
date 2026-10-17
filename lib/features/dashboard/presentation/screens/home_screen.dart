import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/core/widgets/forkd_scaffold.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:forkd/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:forkd/features/dashboard/domain/entities/todo_entity.dart';
import 'package:forkd/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:forkd/features/dashboard/presentation/bloc/merge_requests_bloc.dart';
import 'package:forkd/features/dashboard/presentation/bloc/pipelines_bloc.dart';
import 'package:forkd/features/dashboard/presentation/bloc/projects_bloc.dart';
import 'package:forkd/features/dashboard/presentation/bloc/todos_bloc.dart';
import 'package:forkd/features/dashboard/presentation/mappers/todo_presenter.dart';
import 'package:forkd/features/dashboard/presentation/screens/projects_screen.dart';
import 'package:forkd/features/dashboard/presentation/widgets/dashboard_chrome.dart';
import 'package:forkd/features/dashboard/presentation/widgets/dashboard_states.dart';
import 'package:forkd/features/dashboard/presentation/widgets/merge_request_filter_sheet.dart';
import 'package:forkd/features/dashboard/presentation/widgets/merge_request_tile.dart';
import 'package:forkd/features/dashboard/presentation/widgets/pipeline_tile.dart';
import 'package:forkd/features/dashboard/presentation/widgets/todo_tile.dart';
import 'package:material_symbols_icons/symbols.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const DashboardScreen(),
      const ProjectsScreen(),
      const _ComingSoon('Explore'),
      const _ComingSoon('You'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) => di(),
        ),
        BlocProvider<MergeRequestsBloc>(
          create: (context) => di()..add(const MergeRequestsEvent.started()),
        ),
        BlocProvider<TodosBloc>(
          create: (context) => di()..add(const TodosEvent.started()),
        ),
        BlocProvider<ProjectsBloc>(
          create: (context) => di()..add(const ProjectsEvent.started()),
        ),
        BlocProvider<PipelinesBloc>(
          create: (context) => di()..add(const PipelinesEvent.started()),
        ),
      ],
      child: ForkdScaffold(
        appabar: _currentIndex == 0 ? const _HomeAppBar() : null,
        bottomNavigationbar: _BottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        ),
        body: IndexedStack(index: _currentIndex, children: _screens),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// App bar
// ---------------------------------------------------------------------------

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

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
      title: Text('Home', style: dashboardTitleStyle(context)),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: Space.lg),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _AppBarButton(icon: Symbols.search),
              SizedBox(width: Space.xs),
              _NotificationsButton(),
              SizedBox(width: Space.xs),
              _AccountAvatar(),
            ],
          ),
        ),
      ],
    );
  }
}

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: SizedBox(
        width: 36,
        height: 36,
        child: Center(
          child: Icon(
            icon,
            size: 22,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

/// Bell with an unread dot while the To-Do feed has pending items.
class _NotificationsButton extends StatelessWidget {
  const _NotificationsButton();

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        final hasUnread = state.maybeMap(
          data: (d) => d.items.isNotEmpty,
          orElse: () => false,
        );
        return InkWell(
          onTap: () {},
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: 36,
            height: 36,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(Symbols.notifications, size: 22, color: scheme.onSurface),
                if (hasUnread)
                  Positioned(
                    top: 6,
                    right: 7,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: scheme.error,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AccountAvatar extends StatelessWidget {
  const _AccountAvatar();

  @override
  Widget build(BuildContext context) {
    final git = Theme.of(context).extension<ForkdThemeColors>()!;
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: di<AuthBloc>(),
      builder: (context, state) {
        final account = state.maybeMap(
          data: (d) => d.activeAccount,
          orElse: () => null,
        );
        final label = switch (account) {
          GitlabAccountEntity(:final name) => initialsFor(name),
          GithubAccountEntity(:final login) => initialsFor(login),
          GiteeAccountEntity(:final login) => initialsFor(login),
          null => '',
        };
        return Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: git.renamed.withValues(alpha: 0.18),
            shape: BoxShape.circle,
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 11,
              height: 14 / 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
              color: git.renamed,
            ),
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Bottom bar
// ---------------------------------------------------------------------------

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final caption = theme.textTheme.labelSmall!.copyWith(
      fontSize: 10,
      height: 12 / 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        border: Border(top: BorderSide(color: scheme.outline)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.onSurfaceVariant,
        selectedLabelStyle: caption,
        unselectedLabelStyle: caption,
        items: const [
          BottomNavigationBarItem(icon: Icon(Symbols.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Symbols.folder),
            label: 'Projects',
          ),
          BottomNavigationBarItem(icon: Icon(Symbols.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Symbols.person), label: 'You'),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Dashboard
// ---------------------------------------------------------------------------

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        final section = state.map(selected: (s) => s.section);
        return Column(
          children: [
            _DashboardTabStrip(section: section),
            if (section == DashboardSection.todo)
              const DashboardFilterBar(
                filterLabel: 'All projects · All actions',
                sortLabel: 'Newest first',
              )
            else if (section == DashboardSection.pipelines)
              const DashboardFilterBar(
                filterLabel: 'Your pipelines · All statuses',
                sortLabel: 'Newest first',
              )
            else
              BlocBuilder<MergeRequestsBloc, MergeRequestsState>(
                buildWhen: (a, b) => a.filter != b.filter,
                builder: (context, mrState) => DashboardFilterBar(
                  filterLabel: mrState.filter.summary,
                  sortLabel: mrState.filter.sort.label,
                  onFilterTap: () => showMergeRequestFilterSheet(context),
                ),
              ),
            const Divider(),
            Expanded(
              child: switch (section) {
                DashboardSection.todo => const _TodoFeed(),
                DashboardSection.mergeRequests => const _MergeRequestFeed(),
                DashboardSection.pipelines => const _PipelineFeed(),
                _ => const DashboardPlaceholder(
                  child: Text('Nothing here yet'),
                ),
              },
            ),
          ],
        );
      },
    );
  }
}

/// Tab strip with the live pending count for the To-Do and MR tabs.
class _DashboardTabStrip extends StatelessWidget {
  const _DashboardTabStrip({required this.section});

  final DashboardSection section;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, todoState) =>
          BlocBuilder<MergeRequestsBloc, MergeRequestsState>(
            builder: (context, mrState) => DashboardTabs(
              selectedIndex: section.index,
              onChanged: (i) => context.read<DashboardBloc>().add(
                DashboardEvent.sectionChanged(DashboardSection.values[i]),
              ),
              tabs: [
                DashboardTab(
                  'To-Do',
                  count: todoState.maybeMap(
                    data: (d) => '${d.items.length}',
                    orElse: () => null,
                  ),
                ),
                DashboardTab(
                  'Merge requests',
                  count: mrState.maybeMap(
                    data: (d) => '${d.items.length}',
                    orElse: () => null,
                  ),
                ),
                const DashboardTab('Issues'),
                const DashboardTab('Pipelines'),
              ],
            ),
          ),
    );
  }
}

// ---------------------------------------------------------------------------
// To-Do feed
// ---------------------------------------------------------------------------

class _TodoFeed extends StatelessWidget {
  const _TodoFeed();

  /// Refreshes the todo list and waits for the reload to settle.
  Future<void> _reload(BuildContext context) async {
    context.read<TodosBloc>().add(const TodosEvent.refreshed());
    await context.read<TodosBloc>().stream.firstWhere(
      (s) => s.map(
        loading: (_) => false,
        error: (_) => true,
        data: (d) => !d.isRefreshing,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) => state.map(
        loading: (_) =>
            const DashboardPlaceholder(child: CircularProgressIndicator()),
        error: (e) => RefreshIndicator(
          onRefresh: () => _reload(context),
          child: DashboardPlaceholder(
            child: DashboardErrorView(
              title: 'Failed to load to-dos',
              message: e.err.toString(),
              color: Theme.of(context).colorScheme.error,
              onRetry: () => context.read<TodosBloc>().add(
                const TodosEvent.started(),
              ),
            ),
          ),
        ),
        data: (d) => RefreshIndicator(
          onRefresh: () => _reload(context),
          child: d.items.isEmpty
              ? const DashboardPlaceholder(child: Text('Nothing to do'))
              : _TodoList(items: d.items),
        ),
      ),
    );
  }
}

/// The To-Do rows grouped under Today / Yesterday / Earlier headers.
class _TodoList extends StatelessWidget {
  const _TodoList({required this.items});

  final List<TodoEntity> items;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    TodoGroup? group;
    for (final item in items) {
      final next = todoGroupFor(item.createdAt);
      if (next != group) {
        group = next;
        children.add(_GroupHeader(next.label));
      }
      children
        ..add(
          TodoTile(
            item: item,
            onMarkDone: () => _markDone(context, item),
          ),
        )
        ..add(const Divider());
    }
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: children,
    );
  }

  /// Removes the row optimistically. If the server call fails the bloc
  /// re-fetches, which brings the row back.
  void _markDone(BuildContext context, TodoEntity item) {
    context.read<TodosBloc>().add(TodosEvent.markedDone(item.id));
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Space.lg,
        vertical: Space.sm,
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyLarge!.copyWith(
          fontSize: 13,
          height: 18 / 13,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Merge request feed
// ---------------------------------------------------------------------------

class _MergeRequestFeed extends StatelessWidget {
  const _MergeRequestFeed();

  /// Refreshes the merge request list and waits for the reload to settle.
  Future<void> _reload(BuildContext context) async {
    context.read<MergeRequestsBloc>().add(const MergeRequestsEvent.refreshed());
    await context.read<MergeRequestsBloc>().stream.firstWhere(
      (s) => s.map(
        loading: (_) => false,
        error: (_) => true,
        data: (d) => !d.isRefreshing,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MergeRequestsBloc, MergeRequestsState>(
      builder: (context, state) => state.map(
        loading: (_) =>
            const DashboardPlaceholder(child: CircularProgressIndicator()),
        error: (e) => RefreshIndicator(
          onRefresh: () => _reload(context),
          child: DashboardPlaceholder(
            child: DashboardErrorView(
              title: 'Failed to load merge requests',
              message: e.err.toString(),
              color: Theme.of(context).colorScheme.error,
              onRetry: () => context.read<MergeRequestsBloc>().add(
                const MergeRequestsEvent.started(),
              ),
            ),
          ),
        ),
        data: (d) => RefreshIndicator(
          onRefresh: () => _reload(context),
          child: d.items.isEmpty
              ? const DashboardPlaceholder(child: Text('No merge requests'))
              : ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: d.items.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) => MergeRequestTile(
                    item: d.items[i],
                    onTap: () {},
                  ),
                ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Pipeline feed
// ---------------------------------------------------------------------------

class _PipelineFeed extends StatelessWidget {
  const _PipelineFeed();

  /// Refreshes the pipeline list and waits for the reload to settle.
  Future<void> _reload(BuildContext context) async {
    context.read<PipelinesBloc>().add(const PipelinesEvent.refreshed());
    await context.read<PipelinesBloc>().stream.firstWhere(
      (s) => s.map(
        loading: (_) => false,
        error: (_) => true,
        data: (d) => !d.isRefreshing,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PipelinesBloc, PipelinesState>(
      builder: (context, state) => state.map(
        loading: (_) =>
            const DashboardPlaceholder(child: CircularProgressIndicator()),
        error: (e) => RefreshIndicator(
          onRefresh: () => _reload(context),
          child: DashboardPlaceholder(
            child: DashboardErrorView(
              title: 'Failed to load pipelines',
              message: e.err.toString(),
              color: Theme.of(context).colorScheme.error,
              onRetry: () => context.read<PipelinesBloc>().add(
                const PipelinesEvent.started(),
              ),
            ),
          ),
        ),
        data: (d) => RefreshIndicator(
          onRefresh: () => _reload(context),
          child: d.items.isEmpty
              ? const DashboardPlaceholder(child: Text('No pipelines'))
              : ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: d.items.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, i) =>
                      PipelineTile(item: d.items[i], onTap: () {}),
                ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared states
// ---------------------------------------------------------------------------

/// Centered content shown for the non-dashboard bottom-nav destinations.
class _ComingSoon extends StatelessWidget {
  const _ComingSoon(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ForkdScaffold(
      appabar: AppBar(
        backgroundColor: scheme.surface,
        scrolledUnderElevation: 0,
        toolbarHeight: 48,
        titleSpacing: Space.lg,
        title: Text(title, style: dashboardTitleStyle(context)),
      ),
      body: Center(
        child: Text(
          '$title is coming soon',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
