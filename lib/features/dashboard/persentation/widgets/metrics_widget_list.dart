import 'package:flutter/material.dart';
import 'package:forkd/core/extensions/theme_context.dart';
import 'package:forkd/core/utils/constants.dart';
import 'package:forkd/features/dashboard/domain/entities/dash_metrics_entity.dart';

class MetricsWidgetList extends StatelessWidget {
  const MetricsWidgetList({required this.metrics, super.key});
  final List<DashMetricsEntity> metrics;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: defaultPadding,
        height: 150,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              metricTileWidget(context, metrics: metrics[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          itemCount: metrics.length,
        ),
      ),
    );
  }

  Widget metricTileWidget(
    BuildContext context, {
    required DashMetricsEntity metrics,
  }) {
    return Container(
      width: 175,
      padding: defaultPadding,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.fromBorderSide(
          defaultBorderSide(
            context,
          ).copyWith(color: context.colorScheme.outline),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            metrics.title,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            metrics.value.toString(),
            style: context.theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            metrics.description,
            style: context.theme.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );

    // if (metrics.url != null) {
    //   return LinkWidget(
    //     url: metrics.url,
    //     child: tile,
    //   );
    // }
  }
}
