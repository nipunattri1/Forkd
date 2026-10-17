import 'package:flutter/material.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/features/dashboard/domain/entities/merge_request_entity.dart';
import 'package:forkd/features/dashboard/presentation/mappers/merge_request_presenter.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Maps the design's semantic tones onto [ForkdThemeColors], so light/dark
/// come for free from the theme.
extension ForkdTones on ForkdThemeColors {
  Color labelColor(LabelTone t) => switch (t) {
    LabelTone.danger => deleted,
    LabelTone.info => staged,
    LabelTone.warning => modified,
    LabelTone.success => added,
  };

  Color avatarColor(AvatarTone t) => switch (t) {
    AvatarTone.purple => renamed,
    AvatarTone.blue => staged,
    AvatarTone.orange => conflict,
    AvatarTone.green => added,
  };

  Color pipelineColor(PipelineStatus s) => switch (s) {
    PipelineStatus.success => added,
    PipelineStatus.running => staged,
    PipelineStatus.failed => deleted,
    PipelineStatus.manual => modified,
  };
}

IconData pipelineIcon(PipelineStatus s) => switch (s) {
  PipelineStatus.success => Symbols.check_circle,
  PipelineStatus.running => Symbols.schedule,
  PipelineStatus.failed => Symbols.cancel,
  PipelineStatus.manual => Symbols.pause_circle,
};

/// Readable text colour on top of a solid [background].
Color onColorFor(ThemeData theme, Color background) {
  final isLight =
      ThemeData.estimateBrightnessForColor(background) == Brightness.light;
  if (!isLight) return Colors.white;
  return theme.brightness == Brightness.dark
      ? theme.colorScheme.surface
      : theme.colorScheme.onSurface;
}

class MergeRequestTile extends StatelessWidget {
  const MergeRequestTile({required this.item, this.onTap, super.key});

  final MergeRequestEntity item;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final git = theme.extension<ForkdThemeColors>()!;
    final text = theme.textTheme;

    final meta = text.bodySmall!.copyWith(
      height: 16 / 12,
      color: scheme.onSurfaceVariant,
    );
    final title = text.titleMedium!.copyWith(
      fontWeight: FontWeight.w500,
      height: 20 / 15,
      color: scheme.onSurface,
    );
    final branch = AppType.filePath.copyWith(color: scheme.onSurfaceVariant);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Space.lg,
          vertical: Space.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project line
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _ProjectAvatar(item: item, git: git),
                      const SizedBox(width: Space.xs),
                      Flexible(
                        child: Text(
                          item.projectPath,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: meta,
                        ),
                      ),
                      const SizedBox(width: Space.xs),
                      Text('!${item.iid}', style: meta),
                    ],
                  ),
                ),
                const SizedBox(width: Space.sm),
                Text(relativeTime(item.updatedAt), style: meta),
              ],
            ),
            const SizedBox(height: Space.xs),
            Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: title,
            ),
            const SizedBox(height: Space.xs),
            // Status line
            Row(
              children: [
                Icon(
                  pipelineIcon(item.pipeline),
                  size: 14,
                  color: git.pipelineColor(item.pipeline),
                ),
                const SizedBox(width: Space.sm),
                Expanded(
                  child: Text(
                    '${item.sourceBranch} → ${item.targetBranch}',
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: branch,
                  ),
                ),
                const SizedBox(width: Space.sm),
                _Stat(
                  icon: Symbols.chat_bubble,
                  label: '${item.comments}',
                  color: scheme.onSurfaceVariant,
                  style: meta,
                ),
              ],
            ),
            if (item.labels.isNotEmpty) ...[
              const SizedBox(height: Space.xs),
              Wrap(
                spacing: Space.xs,
                runSpacing: Space.xs,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (final l in item.labels) MrLabelChip(label: l),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ProjectAvatar extends StatelessWidget {
  const _ProjectAvatar({required this.item, required this.git});

  final MergeRequestEntity item;
  final ForkdThemeColors git;

  @override
  Widget build(BuildContext context) {
    final color = git.avatarColor(avatarToneFor(item.projectPath));
    final badge = Theme.of(context).textTheme.labelSmall!.copyWith(
      fontWeight: FontWeight.w500,
      height: 14 / 11,
      letterSpacing: 0,
      color: color,
    );
    return Container(
      width: 16,
      height: 16,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(Radii.sm),
      ),
      child: Text(projectInitial(item.projectPath), style: badge),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.icon,
    required this.label,
    required this.color,
    required this.style,
  });

  final IconData icon;
  final String label;
  final Color color;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
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

class MrLabelChip extends StatelessWidget {
  const MrLabelChip({required this.label, super.key});

  final MrLabelEntity label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final git = theme.extension<ForkdThemeColors>()!;
    final color = git.labelColor(label.tone);
    final badge = theme.textTheme.labelSmall!.copyWith(
      fontWeight: FontWeight.w500,
      height: 14 / 11,
      letterSpacing: 0,
    );
    const pad = EdgeInsets.symmetric(horizontal: Space.sm, vertical: Space.xxs);

    final value = label.value;
    if (value == null) {
      return Container(
        padding: pad,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Radii.pill),
        ),
        child: Text(
          label.name,
          style: badge.copyWith(color: onColorFor(theme, color)),
        ),
      );
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(Radii.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: pad,
            color: color,
            child: Text(
              label.name,
              style: badge.copyWith(color: onColorFor(theme, color)),
            ),
          ),
          Container(
            padding: pad,
            color: theme.colorScheme.surface,
            child: Text(value, style: badge.copyWith(color: color)),
          ),
        ],
      ),
    );
  }
}
