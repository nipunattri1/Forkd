import 'package:flutter/material.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/features/dashboard/domain/entities/project_entity.dart';
import 'package:forkd/features/dashboard/presentation/mappers/merge_request_presenter.dart';
import 'package:forkd/features/dashboard/presentation/mappers/project_presenter.dart';
import 'package:forkd/features/dashboard/presentation/widgets/merge_request_tile.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A row of the Projects list: avatar, namespace/name, description and stats.
class ProjectTile extends StatelessWidget {
  const ProjectTile({required this.item, this.onTap, super.key});

  final ProjectEntity item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final text = theme.textTheme;

    final meta = text.bodySmall!.copyWith(
      height: 16 / 12,
      color: scheme.onSurfaceVariant,
    );
    final name = text.titleMedium!.copyWith(
      fontWeight: FontWeight.w500,
      height: 20 / 15,
      color: scheme.onSurface,
    );

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Space.lg,
          vertical: Space.md,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Avatar(item: item),
            const SizedBox(width: Space.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          '${item.namespace} /',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: meta,
                        ),
                      ),
                      const SizedBox(width: Space.xs),
                      Flexible(
                        child: Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: name,
                        ),
                      ),
                      if (item.isPrivate) ...[
                        const SizedBox(width: Space.xs),
                        Icon(
                          Symbols.lock,
                          size: 12,
                          color: scheme.onSurfaceVariant,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: Space.xs),
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: meta.copyWith(color: scheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: Space.xs),
                  Row(
                    children: [
                      _Stat(
                        icon: Symbols.star,
                        label: '${item.stars}',
                        style: meta,
                      ),
                      const SizedBox(width: Space.md),
                      _Stat(
                        icon: Symbols.fork_right,
                        label: '${item.forks}',
                        style: meta,
                      ),
                      const SizedBox(width: Space.md),
                      _Stat(
                        icon: Symbols.adjust,
                        label: '${item.openIssues}',
                        style: meta,
                      ),
                      const SizedBox(width: Space.md),
                      Expanded(
                        child: Text(
                          projectUpdatedLabel(item.updatedAt),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: meta,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The 40px leading rounded square with the project's first letter.
class _Avatar extends StatelessWidget {
  const _Avatar({required this.item});

  final ProjectEntity item;

  @override
  Widget build(BuildContext context) {
    final git = Theme.of(context).extension<ForkdThemeColors>()!;
    final color = git.avatarColor(avatarToneFor(item.path));
    final letter = Theme.of(context).textTheme.labelSmall!.copyWith(
      fontSize: 20,
      height: 28 / 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: color,
    );

    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(Radii.md),
      ),
      child: Text(projectInitial(item.path), style: letter),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.icon, required this.label, required this.style});

  final IconData icon;
  final String label;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: Space.xs),
        Text(label, style: style.copyWith(color: color)),
      ],
    );
  }
}
