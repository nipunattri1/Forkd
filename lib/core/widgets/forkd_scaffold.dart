import 'package:flutter/material.dart';
import 'package:forkd/core/extensions/theme_context.dart';

class ForkdScaffold extends StatelessWidget {
  const ForkdScaffold({
    super.key,
    required this.body,
    this.appabar,
    this.bottomNavigationbar,
  });
  final Widget body;
  final PreferredSizeWidget? appabar;
  final Widget? bottomNavigationbar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: body,
          appBar: appabar,
          bottomNavigationBar: bottomNavigationbar,
        ),
      ),
    );
  }
}
