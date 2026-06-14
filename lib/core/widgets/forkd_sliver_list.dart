import 'package:flutter/material.dart';
import 'package:forkd/core/extensions/theme_context.dart';
import 'package:forkd/core/utils/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'forkd_sliver_list.freezed.dart';

class ForkdList extends StatelessWidget {
  const ForkdList({super.key, required this.tileData, this.shrinkWrap = false});
  const factory ForkdList.sliver({
    Key? key,
    required List<ForkdListTileData> tileData,
  }) = _ForkdSliverList;
  final List<ForkdListTileData> tileData;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _itemCount,
      itemBuilder: _itemBuilder,
      shrinkWrap: shrinkWrap,
    );
  }

  int get _itemCount => tileData.length;

  Widget? _itemBuilder(BuildContext ctx, int index) {
    final cur = tileData[index];
    final isTop = index == 0;
    final isBottom = index == tileData.length - 1;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.vertical(
          top: isTop ? Radius.circular(defaultRadius) : zeroRadius,
          bottom: isBottom ? Radius.circular(defaultRadius) : zeroRadius,
        ),
        border: Border(
          left: defaultBorderSide(ctx),
          right: defaultBorderSide(ctx),
          top: isTop ? defaultBorderSide(ctx) : BorderSide.none,
          bottom: isBottom ? defaultBorderSide(ctx) : BorderSide.none,
        ),
        color: ctx.colorScheme.surfaceContainerLow,
      ),
      child: switch (cur) {
        _ForkdDefaultListTileData() => ListTile(
          splashColor: ctx.colorScheme.onPrimary,
          leading: Container(
            padding: cur.decoration ? defaultPadding : null,
            decoration: cur.decoration
                ? ShapeDecoration(
                    shape: RoundedSuperellipseBorder(
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    color: ctx.colorScheme.onPrimary,
                  )
                : null,
            child: cur.leading,
          ),
          title: cur.title,
          subtitle: cur.subtitle,
          trailing: cur.trailing,
          onTap: cur.onTap,
        ),
        _ForkdTileWidget() => cur.child,
      },
    );
  }
}

class _ForkdSliverList extends ForkdList {
  const _ForkdSliverList({Key? key, required super.tileData});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: super._itemCount,
      itemBuilder: super._itemBuilder,
    );
  }
}

@freezed
sealed class ForkdListTileData with _$ForkdListTileData {
  factory ForkdListTileData({
    Widget? leading,
    required Widget title,
    Widget? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    @Default(true) bool decoration,
  }) = _ForkdDefaultListTileData;

  const factory ForkdListTileData.custom({required Widget child}) =
      _ForkdTileWidget;

  const ForkdListTileData._();
}
