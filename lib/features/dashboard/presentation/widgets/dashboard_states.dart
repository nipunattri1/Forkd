import 'package:flutter/material.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Centered content that still supports pull-to-refresh.
class DashboardPlaceholder extends StatelessWidget {
  const DashboardPlaceholder({required this.child, super.key});

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

/// Centered error state with a retry button, shared by the dashboard feeds.
class DashboardErrorView extends StatelessWidget {
  const DashboardErrorView({
    required this.title,
    required this.message,
    required this.color,
    required this.onRetry,
    super.key,
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
