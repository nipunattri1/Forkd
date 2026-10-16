import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/features/dashboard/domain/value_objects/merge_request_filter.dart';
import 'package:forkd/features/dashboard/persentation/bloc/merge_requests_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Opens the filter sheet; picking an option dispatches
/// [MergeRequestsEvent.filterChanged] and closes the sheet.
Future<void> showMergeRequestFilterSheet(BuildContext context) {
  final bloc = context.read<MergeRequestsBloc>();
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (sheetContext) => _FilterSheet(
      filter: bloc.state.filter,
      onChanged: (filter) {
        bloc.add(MergeRequestsEvent.filterChanged(filter));
        Navigator.of(sheetContext).pop();
      },
    ),
  );
}

class _FilterSheet extends StatelessWidget {
  const _FilterSheet({required this.filter, required this.onChanged});

  final MergeRequestFilter filter;
  final ValueChanged<MergeRequestFilter> onChanged;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: Space.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Group<MrScope>(
              title: 'Show',
              values: MrScope.values,
              selected: filter.scope,
              label: (v) => v.label,
              onSelected: (v) => onChanged(filter.copyWith(scope: v)),
            ),
            _Group<MrStatus>(
              title: 'State',
              values: MrStatus.values,
              selected: filter.status,
              label: (v) => v.label,
              onSelected: (v) => onChanged(filter.copyWith(status: v)),
            ),
            _Group<MrSort>(
              title: 'Sort by',
              values: MrSort.values,
              selected: filter.sort,
              label: (v) => v.label,
              onSelected: (v) => onChanged(filter.copyWith(sort: v)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Group<T> extends StatelessWidget {
  const _Group({
    required this.title,
    required this.values,
    required this.selected,
    required this.label,
    required this.onSelected,
  });

  final String title;
  final List<T> values;
  final T selected;
  final String Function(T) label;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            Space.lg,
            Space.md,
            Space.lg,
            Space.xs,
          ),
          child: Text(title.toUpperCase(), style: theme.textTheme.labelMedium),
        ),
        for (final v in values)
          InkWell(
            onTap: () => onSelected(v),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Space.lg,
                vertical: Space.sm,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      label(v),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  if (v == selected)
                    Icon(
                      Symbols.check,
                      size: 18,
                      color: theme.colorScheme.primary,
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
