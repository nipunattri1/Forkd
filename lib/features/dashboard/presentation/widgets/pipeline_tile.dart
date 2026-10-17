import 'package:flutter/material.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/features/dashboard/domain/entities/pipeline_entity.dart';
import 'package:forkd/features/dashboard/presentation/mappers/pipeline_presenter.dart';
import 'package:forkd/features/dashboard/presentation/widgets/merge_request_tile.dart';

/// One pipeline row: overall status, commit title, project, branch and the
/// per-stage run.
class PipelineTile extends StatelessWidget {
  const PipelineTile({required this.item, this.onTap, super.key});

  final PipelineEntity item;
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
    final reference = AppType.sha.copyWith(color: scheme.onSurfaceVariant);
    final title = text.titleMedium!.copyWith(
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
            Icon(
              pipelineIcon(item.status),
              size: 20,
              color: git.pipelineColor(item.status),
            ),
            const SizedBox(width: Space.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: title,
                  ),
                  const SizedBox(height: Space.xs),
                  Row(
                    children: [
                      Text('#${item.id}', style: reference),
                      const SizedBox(width: Space.xs),
                      Flexible(
                        child: Text(
                          item.projectPath,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: meta,
                        ),
                      ),
                    ],
                  ),
                  if (item.ref.isNotEmpty) ...[
                    const SizedBox(height: Space.xs),
                    Text(
                      item.ref,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppType.filePath.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  const SizedBox(height: Space.xs),
                  Row(
                    children: [
                      Expanded(
                        child: _StageStrip(stages: item.stages, git: git),
                      ),
                      const SizedBox(width: Space.sm),
                      Text(
                        pipelineTimeLabel(item.duration, item.updatedAt),
                        style: meta,
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

/// Stage icons joined by 2px connectors, in run order.
class _StageStrip extends StatelessWidget {
  const _StageStrip({required this.stages, required this.git});

  final List<PipelineStageEntity> stages;
  final ForkdThemeColors git;

  @override
  Widget build(BuildContext context) {
    if (stages.isEmpty) return const SizedBox.shrink();
    final connector = Theme.of(context).colorScheme.outline;

    return Row(
      children: [
        for (var i = 0; i < stages.length; i++) ...[
          if (i > 0) ...[
            const SizedBox(width: Space.xxs),
            Container(width: 8, height: 2, color: connector),
            const SizedBox(width: Space.xxs),
          ],
          Icon(
            pipelineIcon(stages[i].status),
            size: 14,
            color: git.pipelineColor(stages[i].status),
          ),
        ],
      ],
    );
  }
}
