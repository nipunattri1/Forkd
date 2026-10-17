import 'package:flutter/material.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/features/dashboard/domain/entities/todo_entity.dart';
import 'package:forkd/features/dashboard/presentation/mappers/merge_request_presenter.dart';
import 'package:forkd/features/dashboard/presentation/mappers/todo_presenter.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A single row of the To-Do feed: avatar, actor line, title, reference and a
/// mark-done button.
class TodoTile extends StatelessWidget {
  const TodoTile({required this.item, this.onMarkDone, super.key});

  final TodoEntity item;
  final VoidCallback? onMarkDone;

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

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Space.lg,
        vertical: Space.md,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Avatar(item: item, git: git),
          const SizedBox(width: Space.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ActionLine(item: item, style: meta),
                const SizedBox(height: Space.xxs),
                Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: title,
                ),
                const SizedBox(height: Space.xxs),
                Row(
                  children: [
                    Icon(
                      item.targetType == TodoTargetType.mergeRequest
                          ? Symbols.merge
                          : Symbols.adjust,
                      size: 12,
                      color: scheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: Space.xs),
                    Expanded(
                      child: Text(
                        item.reference,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: meta,
                      ),
                    ),
                    const SizedBox(width: Space.xs),
                    Text(todoTimeLabel(item.createdAt), style: meta),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: Space.md),
          _MarkDoneButton(onTap: onMarkDone),
        ],
      ),
    );
  }
}

/// The 32px leading circle: a user's initials, or a danger icon for system
/// todos (failed pipelines).
class _Avatar extends StatelessWidget {
  const _Avatar({required this.item, required this.git});

  final TodoEntity item;
  final ForkdThemeColors git;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (item.action.isSystem) {
      return Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: git.deleted.withValues(alpha: 0.18),
          shape: BoxShape.circle,
        ),
        child: Icon(Symbols.cancel, size: 18, color: git.deleted),
      );
    }

    final name = item.authorName ?? '';
    final color = switch (avatarToneFor(name)) {
      AvatarTone.purple => git.renamed,
      AvatarTone.blue => git.staged,
      AvatarTone.orange => git.conflict,
      AvatarTone.green => git.added,
    };
    final badge = theme.textTheme.labelSmall!.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 14 / 11,
      letterSpacing: 0,
      color: color,
    );

    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        shape: BoxShape.circle,
      ),
      child: Text(initialsFor(name), style: badge),
    );
  }
}

/// `Priya Nair` + `requested your review`, or a bare danger label for system
/// todos.
class _ActionLine extends StatelessWidget {
  const _ActionLine({required this.item, required this.style});

  final TodoEntity item;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    if (item.action.isSystem) {
      return Text(
        item.action.label,
        style: style.copyWith(fontWeight: FontWeight.w500, color: scheme.error),
      );
    }

    return Row(
      children: [
        Flexible(
          child: Text(
            item.authorName ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style.copyWith(
              fontWeight: FontWeight.w500,
              color: scheme.onSurface,
            ),
          ),
        ),
        const SizedBox(width: Space.xs),
        Expanded(
          child: Text(
            item.action.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
        ),
      ],
    );
  }
}

class _MarkDoneButton extends StatelessWidget {
  const _MarkDoneButton({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: scheme.outline),
        ),
        child: Icon(
          Symbols.check,
          size: 16,
          color: scheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
