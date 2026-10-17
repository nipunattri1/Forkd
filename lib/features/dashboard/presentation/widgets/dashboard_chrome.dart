import 'package:flutter/material.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:material_symbols_icons/symbols.dart';

@immutable
class DashboardTab {
  const DashboardTab(this.label, {this.count});

  final String label;
  final String? count;
}

/// The 22px screen title used by the dashboard app bars (`Home`, `Projects`).
TextStyle dashboardTitleStyle(BuildContext context) {
  final theme = Theme.of(context);
  return theme.textTheme.titleLarge!.copyWith(
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: -0.3,
    color: theme.colorScheme.onSurface,
  );
}

/// Horizontally scrollable tab strip with a 2px active indicator.
class DashboardTabs extends StatelessWidget {
  const DashboardTabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });

  final List<DashboardTab> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: scheme.outline)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Space.lg),
        child: Row(
          children: [
            for (var i = 0; i < tabs.length; i++) ...[
              if (i > 0) const SizedBox(width: Space.lg),
              _TabItem(
                tab: tabs[i],
                selected: i == selectedIndex,
                onTap: () => onChanged(i),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.tab,
    required this.selected,
    required this.onTap,
  });

  final DashboardTab tab;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final labelColor = selected ? scheme.onSurface : scheme.onSurfaceVariant;

    final labelStyle = theme.textTheme.bodyMedium!.copyWith(
      fontSize: 14,
      height: 20 / 14,
      fontWeight: FontWeight.w500,
      color: labelColor,
    );
    final countStyle = theme.textTheme.labelSmall!.copyWith(
      fontWeight: FontWeight.w500,
      height: 14 / 11,
      letterSpacing: 0,
      color: selected ? scheme.primary : scheme.onSurfaceVariant,
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: Space.sm),
        // 2px active indicator drawn as a bottom border, so the tab sizes to
        // its content (a stretched Column would need a bounded width).
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: selected ? scheme.primary : Colors.transparent,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: Space.sm),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(tab.label, style: labelStyle),
              if (tab.count != null) ...[
                const SizedBox(width: Space.xs),
                Container(
                  height: 16,
                  constraints: const BoxConstraints(minWidth: 18),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selected
                        ? scheme.primaryContainer
                        : scheme.outlineVariant,
                    borderRadius: BorderRadius.circular(Radii.pill),
                  ),
                  child: Text(tab.count!, style: countStyle),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardFilterBar extends StatelessWidget {
  const DashboardFilterBar({
    required this.filterLabel,
    required this.sortLabel,
    this.onFilterTap,
    super.key,
  });

  final String filterLabel;
  final String sortLabel;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final small = theme.textTheme.bodySmall!.copyWith(height: 16 / 12);

    return Container(
      height: 40,
      color: scheme.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(horizontal: Space.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onFilterTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  filterLabel,
                  style: small.copyWith(
                    fontWeight: FontWeight.w500,
                    color: scheme.onSurface,
                  ),
                ),
                const SizedBox(width: Space.xs),
                Icon(
                  Symbols.keyboard_arrow_down,
                  size: 14,
                  color: scheme.onSurface,
                ),
              ],
            ),
          ),
          Text(sortLabel, style: small),
        ],
      ),
    );
  }
}
