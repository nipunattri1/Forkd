import 'package:flutter/widgets.dart';
import 'package:forkd/core/extensions/theme_context.dart';

const defaultRadius = 12.0;

const Radius zeroRadius = Radius.zero;

BorderSide defaultBorderSide(BuildContext context) =>
    BorderSide(color: context.colorScheme.onPrimaryContainer, width: 2);

const defaultPadding = EdgeInsets.all(8);
