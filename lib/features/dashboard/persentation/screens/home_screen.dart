import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/core/widgets/forkd_scaffold.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/dashboard/persentation/bloc/dashboard_section_cubit.dart';
import 'package:forkd/features/dashboard/persentation/bloc/merge_requests_bloc.dart';
import 'package:forkd/features/dashboard/persentation/widgets/dashboard_chrome.dart';
import 'package:forkd/features/dashboard/persentation/widgets/merge_request_filter_sheet.dart';
import 'package:forkd/features/dashboard/persentation/widgets/merge_request_tile.dart';
import 'package:go_router/go_router.dart';
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
      ForkdScaffold(body: Container()), // Projects
      ForkdScaffold(body: Container()), // Explore
      ForkdScaffold(body: Container()), // You
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MergeRequestsBloc>(
          create: (context) => di()..add(const MergeRequestsEvent.started()),
        ),
        BlocProvider<DashboardSectionCubit>(
          create: (context) => DashboardSectionCubit(),
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

  static const _initials = 'NA';

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final git = theme.extension<ForkdThemeColors>()!;

    final titleStyle = theme.textTheme.titleLarge!.copyWith(
      fontSize: 22,
      height: 28 / 22,
      letterSpacing: -0.3,
      color: scheme.onSurface,
    );

    return AppBar(
      backgroundColor: scheme.surface,
      scrolledUnderElevation: 0,
      toolbarHeight: 48,
      titleSpacing: Space.lg,
      title: Text('Home', style: titleStyle),
      actions: [
        _ActionIcon(
          icon: Symbols.search,
          onPressed: () => context.push('/gitlab/search'),
        ),
        const SizedBox(width: Space.xs),
        _ActionIcon(
          icon: Symbols.notifications,
          showDot: true,
          onPressed: () => context.push('/gitlab/todos'),
        ),
        const SizedBox(width: Space.xs),
        GestureDetector(
          onTap: () => context.push('/settings'),
          child: Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: git.renamed.withValues(alpha: 0.16),
              shape: BoxShape.circle,
            ),
            child: Text(
              _initials,
              style: theme.textTheme.labelSmall!.copyWith(
                fontWeight: FontWeight.w500,
                height: 14 / 11,
                letterSpacing: 0,
                color: git.renamed,
              ),
            ),
          ),
        ),
        const SizedBox(width: Space.lg),
      ],
    );
  }
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({
    required this.icon,
    required this.onPressed,
    this.showDot = false,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 36,
      height: 36,
      child: Stack(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightFor(width: 36, height: 36),
            iconSize: 22,
            color: scheme.onSurface,
            icon: Icon(icon),
            onPressed: onPressed,
          ),
          if (showDot)
            Positioned(
              top: 6,
              right: 7,
              child: IgnorePointer(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: scheme.error,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
        ],
      ),
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
      builder: (context, state) {
        return state.map(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          error: (e) => RefreshIndicator(
            onRefresh: () => _reload(context),
            child: _Placeholder(
              child: _ErrorView(
                title: 'Failed to load merge requests',
                message: e.err.toString(),
                color: Theme.of(context).colorScheme.error,
                onRetry: () => context.read<MergeRequestsBloc>().add(
                      const MergeRequestsEvent.started(),
                    ),
              ),
            ),
          ),
          data: (d) => Column(
            children: [
              BlocBuilder<DashboardSectionCubit, DashboardSection>(
                builder: (context, section) => DashboardTabs(
                  selectedIndex: section.index,
                  onChanged: (i) => context.read<DashboardSectionCubit>().select(
                        DashboardSection.values[i],
                      ),
                  tabs: const [
                    DashboardTab('To-Do'),
                    DashboardTab('Merge requests'),
                    DashboardTab('Issues'),
                    DashboardTab('Pipelines'),
                  ],
                ),
              ),
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
                child: RefreshIndicator(
                  onRefresh: () => _reload(context),
                  child: BlocBuilder<MergeRequestsBloc, MergeRequestsState>(
                    builder: (context, mrState) => mrState.map(
                      loading: (_) =>
                          const _Placeholder(child: CircularProgressIndicator()),
                      error: (e) => _Placeholder(
                        child: _ErrorView(
                          title: 'Failed to load merge requests',
                          message: e.err.toString(),
                          color: Theme.of(context).colorScheme.error,
                          onRetry: () => context
                              .read<MergeRequestsBloc>()
                              .add(const MergeRequestsEvent.started()),
                        ),
                      ),
                      data: (d) => d.items.isEmpty
                          ? const _Placeholder(child: Text('No merge requests'))
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


/// Centered content that still supports pull-to-refresh.
class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodySmall!,
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    required this.title,
    required this.message,
    required this.color,
    required this.onRetry,
  });

  final String title;
  final String message;
  final Color color;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(Space.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Symbols.error_outline, size: 48, color: color),
          const SizedBox(height: Space.lg),
          Text(title, style: theme.textTheme.titleMedium),
          const SizedBox(height: Space.sm),
          Text(
            message,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: Space.xl),
          FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Symbols.refresh),
            label: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
