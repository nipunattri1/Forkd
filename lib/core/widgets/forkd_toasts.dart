import 'package:flutter/material.dart';
import 'package:forkd/core/extensions/theme_context.dart';
import 'package:forkd/core/utils/constants.dart';
import 'package:toastification/toastification.dart';

class ForkdToasts {
  /// Displays a success toast notification utilizing theme colors and typography.
  static void success({
    required BuildContext context,
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 4),
  }) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;

    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: duration,
      alignment: Alignment.topRight,
      title: Text(
        title ?? 'Success',
        style: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
      description: Text(
        message,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      // Adhering to theme standards
      primaryColor:
          Colors.green, // Fallback accent for success if not in custom scheme
      backgroundColor: colorScheme.surface,
      borderRadius: BorderRadius.circular(defaultRadius),
      boxShadow: kElevationToShadow[2],
    );
  }

  /// Displays an error toast notification using Material Design error color tokens.
  static void error(
    String error, {
    required BuildContext context,
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 5),
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: duration,
      alignment: Alignment.topRight,
      title: Text(
        title ?? 'Error',
        style: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onErrorContainer,
        ),
      ),
      description: Text(
        message,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onErrorContainer.withAlpha(200),
        ),
      ),
      // Adhering to theme standards
      primaryColor: colorScheme.error,
      backgroundColor: colorScheme.errorContainer,
      borderRadius: BorderRadius.circular(defaultRadius),
      boxShadow: kElevationToShadow[2],
    );
  }

  static void info({
    required BuildContext context,
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 4),
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: duration,
      alignment: Alignment.topRight,
      title: Text(
        title ?? 'Information',
        style: theme.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSecondaryContainer,
        ),
      ),
      description: Text(
        message,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSecondaryContainer.withAlpha(200),
        ),
      ),
      // Adhering to theme standards
      primaryColor: colorScheme.secondary,
      backgroundColor: colorScheme.secondaryContainer,
      borderRadius: BorderRadius.circular(defaultRadius),
      boxShadow: kElevationToShadow[2],
    );
  }
}
