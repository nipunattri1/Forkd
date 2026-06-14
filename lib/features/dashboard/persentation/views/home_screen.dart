import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/core/common/strings.dart';
import 'package:forkd/core/extensions/theme_context.dart';
import 'package:forkd/core/widgets/forkd_scaffold.dart';
import 'package:forkd/core/widgets/forkd_sliver_list.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:forkd/features/dashboard/domain/entities/dash_metrics_entity.dart';
import 'package:forkd/features/dashboard/persentation/bloc/dashboard_bloc.dart';
import 'package:forkd/features/dashboard/persentation/widgets/metrics_widget_list.dart';
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
      ForkdScaffold(body: Container()),
      ForkdScaffold(body: Container()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (context) => di()..add(const DashboardBlocEvent.reloadData()),
      child: ForkdScaffold(
        appabar: _currentIndex == 0
            ? AppBar(
                title: Text(
                  appName,
                  style: context.theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Symbols.settings),
                    onPressed: () => context.push('/settings'),
                  ),
                ],
              )
            : null,
        bottomNavigationbar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Symbols.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Symbols.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Symbols.checklist),
              label: 'Todos',
            ),
          ],
        ),
        body: IndexedStack(index: _currentIndex, children: _screens),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardBlocState>(
      builder: (context, state) {
        return state.map(
          data: (value) => RefreshIndicator(
            onRefresh: () async {
              final bloc = context.read<DashboardBloc>();
              bloc.add(const DashboardBlocEvent.reloadData());
              await bloc.stream.firstWhere(
                (state) => state.map(
                  data: (_) => true,
                  error: (_) => true,
                  loading: (_) => false,
                ),
              );
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                // Active User Profile Header
                SliverToBoxAdapter(
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, authState) {
                      return authState.maybeMap(
                        data: (value) {
                          final account = value.activeAccount;
                          // if (account is GitlabAccountEntity) {
                          //   // create a user header
                          //   return ;
                          // }
                          return const SizedBox.shrink();
                        },
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
                const SliverToBoxAdapter(child: Divider()),
                // Metrics horizontal list
                MetricsWidgetList(
                  metrics: [
                    DashMetricsEntity(
                      title: 'Todos',
                      value: value.data.todos,
                      description: 'Pending actions',
                      url: '/gitlab/todos',
                    ),
                    DashMetricsEntity(
                      title: 'Merge requests',
                      value: value.data.mergeRequests,
                      description: 'Waiting for your review',
                    ),
                    DashMetricsEntity(
                      title: 'Merge requests',
                      value: value.data.assignedMergeRequests,
                      description: 'Assigned to you',
                    ),
                    DashMetricsEntity(
                      title: 'Issues',
                      value: value.data.assignedIssues,
                      description: 'Assigned to you',
                    ),
                    DashMetricsEntity(
                      title: 'Merge requests',
                      value: value.data.reviewRequestedMergeRequests,
                      description: 'Reviews requested',
                    ),
                  ],
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Divider(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Text(
                      'Quick Navigation',
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                  ),
                  sliver: ForkdList.sliver(
                    tileData: [
                      ForkdListTileData(
                        leading: Icon(
                          Symbols.group,
                          color: context.colorScheme.primary,
                        ),
                        title: const Text('My Groups'),
                        subtitle: const Text(
                          'View and manage your GitLab groups',
                        ),
                        trailing: const Icon(Symbols.chevron_right),
                        onTap: () => context.push('/gitlab/groups'),
                        decoration: false,
                      ),
                      ForkdListTileData(
                        leading: Icon(
                          Symbols.search,
                          color: context.colorScheme.primary,
                        ),
                        title: const Text('Search'),
                        subtitle: const Text(
                          'Find projects, issues, and users',
                        ),
                        trailing: const Icon(Symbols.chevron_right),
                        onTap: () => context.push('/gitlab/search'),
                        decoration: false,
                      ),
                      ForkdListTileData(
                        leading: Icon(
                          Symbols.settings,
                          color: context.colorScheme.primary,
                        ),
                        title: const Text('Settings'),
                        subtitle: const Text('Configure application settings'),
                        trailing: const Icon(Symbols.chevron_right),
                        onTap: () => context.push('/settings'),
                        decoration: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          error: (e) => RefreshIndicator(
            onRefresh: () async {
              context.read<DashboardBloc>().add(
                const DashboardBlocEvent.reloadData(),
              );
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Symbols.error_outline,
                            size: 48,
                            color: context.colorScheme.error,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Failed to load dashboard data',
                            style: context.theme.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            e.err.toString(),
                            textAlign: TextAlign.center,
                            style: context.theme.textTheme.bodyMedium?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 24),
                          FilledButton.icon(
                            onPressed: () {
                              context.read<DashboardBloc>().add(
                                const DashboardBlocEvent.reloadData(),
                              );
                            },
                            icon: const Icon(Symbols.refresh),
                            label: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          loading: (_) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
