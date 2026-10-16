import 'package:flutter/material.dart';

abstract final class ForkdTheme {
  static final ThemeData light = _build(
    scheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF0969DA),
      onPrimary: Color.fromARGB(255, 180, 77, 77),
      primaryContainer: Color(0xFFDDEAFA),
      onPrimaryContainer: Color(0xFF1F2328),
      secondary: Color(0xFF57606A),
      onSecondary: Colors.white,
      error: Color(0xFFCF222E),
      onError: Colors.white,
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1F2328),
      onSurfaceVariant: Color(0xFF57606A),
      surfaceContainerLowest: Color(0xFFEEF1F4),
      surfaceContainerLow: Color(0xFFF6F8FA),
      surfaceContainer: Color(0xFFF6F8FA),
      surfaceContainerHigh: Color(0xFFFFFFFF),
      outline: Color(0xFFD0D7DE),
      outlineVariant: Color(0xFFE3E8ED),
      surfaceTint: Colors.transparent,
    ),
    git: ForkdThemeColors.light,
    hover: const Color(0x0F1F2328),
    pressed: const Color(0x1A1F2328),
  );

  static final ThemeData dark = _build(
    scheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF58A6FF),
      onPrimary: Color(0xFF0D1117),
      primaryContainer: Color(0xFF122B52),
      onPrimaryContainer: Color(0xFFE6EDF3),
      secondary: Color(0xFF9DA7B3),
      onSecondary: Color(0xFF0D1117),
      error: Color(0xFFF85149),
      onError: Color(0xFF0D1117),
      surface: Color(0xFF0D1117),
      onSurface: Color(0xFFE6EDF3),
      onSurfaceVariant: Color(0xFF9DA7B3),
      surfaceContainerLowest: Color(0xFF010409),
      surfaceContainerLow: Color(0xFF161B22),
      surfaceContainer: Color(0xFF161B22),
      surfaceContainerHigh: Color(0xFF1C2128),
      outline: Color(0xFF30363D),
      outlineVariant: Color(0xFF21262D),
      surfaceTint: Colors.transparent,
    ),
    git: ForkdThemeColors.dark,
    hover: const Color(0x14E6EDF3),
    pressed: const Color(0x1FE6EDF3),
  );

  static ThemeData _build({
    required ColorScheme scheme,
    required ForkdThemeColors git,
    required Color hover,
    required Color pressed,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textTheme: AppType.textTheme(scheme.onSurface, scheme.onSurfaceVariant),
      hoverColor: hover,
      highlightColor: pressed,
      focusColor: scheme.primary.withValues(alpha: 0.16),
      splashFactory: NoSplash.splashFactory,
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        elevation: 12,
        shadowColor: scheme.brightness == Brightness.dark
            ? const Color(0x99000000)
            : const Color(0x2E1F2328),
        shape: RoundedRectangleBorder(
          borderRadius: Radii.lgAll,
          side: BorderSide(color: scheme.outline),
        ),
      ),
      extensions: <ThemeExtension<dynamic>>[git],
    );
  }
}

@immutable
class ForkdThemeColors extends ThemeExtension<ForkdThemeColors> {
  const ForkdThemeColors({
    required this.added,
    required this.deleted,
    required this.modified,
    required this.renamed,
    required this.untracked,
    required this.staged,
    required this.conflict,
    required this.diffAddedBg,
    required this.diffAddedWord,
    required this.diffAddedGutter,
    required this.diffDeletedBg,
    required this.diffDeletedWord,
    required this.diffDeletedGutter,
    required this.diffModifiedBg,
    required this.diffModifiedWord,
    required this.diffModifiedGutter,
    required this.diffHunkBg,
    required this.conflictBg,
    required this.conflictOursBg,
    required this.conflictTheirsBg,
    required this.branchCurrent,
    required this.branchRemote,
    required this.branchAhead,
    required this.branchBehind,
  });

  // Status foregrounds (also used as diff foregrounds)
  final Color added;
  final Color deleted;
  final Color modified;
  final Color renamed;
  final Color untracked;
  final Color staged;
  final Color conflict;

  // Diff: line tint, intra-line word highlight, gutter
  final Color diffAddedBg;
  final Color diffAddedWord;
  final Color diffAddedGutter;
  final Color diffDeletedBg;
  final Color diffDeletedWord;
  final Color diffDeletedGutter;
  final Color diffModifiedBg;
  final Color diffHunkBg;
  final Color diffModifiedWord;
  final Color diffModifiedGutter;

  // Conflicts
  final Color conflictBg;
  final Color conflictOursBg;
  final Color conflictTheirsBg;

  // Branch status
  final Color branchCurrent;
  final Color branchRemote;
  final Color branchAhead;
  final Color branchBehind;

  static const light = ForkdThemeColors(
    added: Color(0xFF1A7F37),
    deleted: Color(0xFFCF222E),
    modified: Color(0xFF9A6700),
    renamed: Color(0xFF8250DF),
    untracked: Color(0xFF0A7B83),
    staged: Color(0xFF0969DA),
    conflict: Color(0xFFBC4C00),
    diffAddedBg: Color(0x1F1A7F37),
    diffAddedWord: Color(0x4D1A7F37),
    diffAddedGutter: Color(0x331A7F37),
    diffDeletedBg: Color(0x1FCF222E),
    diffDeletedWord: Color(0x4DCF222E),
    diffDeletedGutter: Color(0x33CF222E),
    diffModifiedBg: Color(0x26BF8700),
    diffModifiedWord: Color(0x59BF8700),
    diffModifiedGutter: Color(0x40BF8700),
    diffHunkBg: Color(0x140969DA),
    conflictBg: Color(0x1FBC4C00),
    conflictOursBg: Color(0x1F0969DA),
    conflictTheirsBg: Color(0x1F8250DF),
    branchCurrent: Color(0xFF0969DA),
    branchRemote: Color(0xFF8250DF),
    branchAhead: Color(0xFF1A7F37),
    branchBehind: Color(0xFF9A6700),
  );

  static const dark = ForkdThemeColors(
    added: Color(0xFF3FB950),
    deleted: Color(0xFFF85149),
    modified: Color(0xFFD29922),
    renamed: Color(0xFFBC8CFF),
    untracked: Color(0xFF39C5CF),
    staged: Color(0xFF58A6FF),
    conflict: Color(0xFFF0883E),
    diffAddedBg: Color(0x263FB950),
    diffAddedWord: Color(0x663FB950),
    diffAddedGutter: Color(0x403FB950),
    diffDeletedBg: Color(0x26F85149),
    diffDeletedWord: Color(0x66F85149),
    diffDeletedGutter: Color(0x40F85149),
    diffModifiedBg: Color(0x26D29922),
    diffModifiedWord: Color(0x66D29922),
    diffModifiedGutter: Color(0x40D29922),
    diffHunkBg: Color(0x1F58A6FF),
    conflictBg: Color(0x26F0883E),
    conflictOursBg: Color(0x2658A6FF),
    conflictTheirsBg: Color(0x26BC8CFF),
    branchCurrent: Color(0xFF58A6FF),
    branchRemote: Color(0xFFBC8CFF),
    branchAhead: Color(0xFF3FB950),
    branchBehind: Color(0xFFD29922),
  );

  @override
  ForkdThemeColors copyWith({
    Color? added,
    Color? deleted,
    Color? modified,
    Color? renamed,
    Color? untracked,
    Color? staged,
    Color? conflict,
    Color? diffAddedBg,
    Color? diffAddedWord,
    Color? diffAddedGutter,
    Color? diffDeletedBg,
    Color? diffDeletedWord,
    Color? diffDeletedGutter,
    Color? diffModifiedBg,
    Color? diffModifiedWord,
    Color? diffModifiedGutter,
    Color? diffHunkBg,
    Color? conflictBg,
    Color? conflictOursBg,
    Color? conflictTheirsBg,
    Color? branchCurrent,
    Color? branchRemote,
    Color? branchAhead,
    Color? branchBehind,
  }) {
    return ForkdThemeColors(
      added: added ?? this.added,
      deleted: deleted ?? this.deleted,
      modified: modified ?? this.modified,
      renamed: renamed ?? this.renamed,
      untracked: untracked ?? this.untracked,
      staged: staged ?? this.staged,
      conflict: conflict ?? this.conflict,
      diffAddedBg: diffAddedBg ?? this.diffAddedBg,
      diffAddedWord: diffAddedWord ?? this.diffAddedWord,
      diffAddedGutter: diffAddedGutter ?? this.diffAddedGutter,
      diffDeletedBg: diffDeletedBg ?? this.diffDeletedBg,
      diffDeletedWord: diffDeletedWord ?? this.diffDeletedWord,
      diffDeletedGutter: diffDeletedGutter ?? this.diffDeletedGutter,
      diffModifiedBg: diffModifiedBg ?? this.diffModifiedBg,
      diffModifiedWord: diffModifiedWord ?? this.diffModifiedWord,
      diffModifiedGutter: diffModifiedGutter ?? this.diffModifiedGutter,
      diffHunkBg: diffHunkBg ?? this.diffHunkBg,
      conflictBg: conflictBg ?? this.conflictBg,
      conflictOursBg: conflictOursBg ?? this.conflictOursBg,
      conflictTheirsBg: conflictTheirsBg ?? this.conflictTheirsBg,
      branchCurrent: branchCurrent ?? this.branchCurrent,
      branchRemote: branchRemote ?? this.branchRemote,
      branchAhead: branchAhead ?? this.branchAhead,
      branchBehind: branchBehind ?? this.branchBehind,
    );
  }

  @override
  ForkdThemeColors lerp(ThemeExtension<ForkdThemeColors>? other, double t) {
    if (other is! ForkdThemeColors) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return ForkdThemeColors(
      added: l(added, other.added),
      deleted: l(deleted, other.deleted),
      modified: l(modified, other.modified),
      renamed: l(renamed, other.renamed),
      untracked: l(untracked, other.untracked),
      staged: l(staged, other.staged),
      conflict: l(conflict, other.conflict),
      diffAddedBg: l(diffAddedBg, other.diffAddedBg),
      diffAddedWord: l(diffAddedWord, other.diffAddedWord),
      diffAddedGutter: l(diffAddedGutter, other.diffAddedGutter),
      diffDeletedBg: l(diffDeletedBg, other.diffDeletedBg),
      diffDeletedWord: l(diffDeletedWord, other.diffDeletedWord),
      diffDeletedGutter: l(diffDeletedGutter, other.diffDeletedGutter),
      diffModifiedBg: l(diffModifiedBg, other.diffModifiedBg),
      diffModifiedWord: l(diffModifiedWord, other.diffModifiedWord),
      diffModifiedGutter: l(diffModifiedGutter, other.diffModifiedGutter),
      diffHunkBg: l(diffHunkBg, other.diffHunkBg),
      conflictBg: l(conflictBg, other.conflictBg),
      conflictOursBg: l(conflictOursBg, other.conflictOursBg),
      conflictTheirsBg: l(conflictTheirsBg, other.conflictTheirsBg),
      branchCurrent: l(branchCurrent, other.branchCurrent),
      branchRemote: l(branchRemote, other.branchRemote),
      branchAhead: l(branchAhead, other.branchAhead),
      branchBehind: l(branchBehind, other.branchBehind),
    );
  }
}

extension GitThemeContext on BuildContext {
  /// `context.theme.added`, with a safe fallback if the extension is missing.
  ForkdThemeColors get theme {
    final theme = Theme.of(this);
    return theme.extension<ForkdThemeColors>() ??
        (theme.brightness == Brightness.dark
            ? ForkdThemeColors.dark
            : ForkdThemeColors.light);
  }
}

abstract final class Space {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
}

abstract final class Radii {
  static const double xs = 2;
  static const double sm = 4;
  static const double md = 6;
  static const double lg = 8;
  static const double pill = 999;
  static const lgAll = BorderRadius.all(Radius.circular(lg));
}

abstract final class AppShadows {
  static const lightE2 = [
    BoxShadow(color: Color(0x1F1F2328), blurRadius: 12, offset: Offset(0, 4)),
    BoxShadow(color: Color(0x141F2328), blurRadius: 3, offset: Offset(0, 1)),
  ];
  static const darkE2 = [
    BoxShadow(color: Color(0x80000000), blurRadius: 12, offset: Offset(0, 4)),
  ];
}

abstract final class AppType {
  static const ui = 'Inter';
  static const mono = 'JetBrains Mono';
  static const uiFallback = ['SF Pro Text', 'Segoe UI', 'Roboto'];
  static const monoFallback = ['SF Mono', 'Menlo', 'Consolas', 'Roboto Mono'];

  static TextStyle _ui(
    double size,
    double lh,
    FontWeight w, [
    double ls = 0,
    Color? color,
  ]) => TextStyle(
    fontFamily: ui,
    fontFamilyFallback: uiFallback,
    fontSize: size,
    height: lh / size,
    fontWeight: w,
    letterSpacing: ls,
    color: color,
    leadingDistribution: TextLeadingDistribution.even,
  );

  static TextTheme textTheme(Color primary, Color secondary) => TextTheme(
    titleLarge: _ui(18, 24, FontWeight.w600, -0.2, primary),
    titleMedium: _ui(15, 22, FontWeight.w600, -0.1, primary),
    bodyLarge: _ui(13, 18, FontWeight.w500, 0, primary),
    bodyMedium: _ui(13, 20, FontWeight.w400, 0, primary),
    bodySmall: _ui(12, 18, FontWeight.w400, 0, secondary),
    labelLarge: _ui(13, 16, FontWeight.w500, 0, primary),
    labelMedium: _ui(12, 16, FontWeight.w600, 0.5, secondary),
    labelSmall: _ui(11, 16, FontWeight.w400, 0.2, secondary),
  );

  static TextStyle _mono(double size, double lh, FontWeight w, double ls) =>
      TextStyle(
        fontFamily: mono,
        fontFamilyFallback: monoFallback,
        fontSize: size,
        height: lh / size,
        fontWeight: w,
        letterSpacing: ls,
        leadingDistribution: TextLeadingDistribution.even,
        fontFeatures: const [
          FontFeature.tabularFigures(),
          FontFeature.disable('liga'),
          FontFeature.disable('calt'),
        ],
      );

  // Colorless: apply color at the call site from the theme.
  static final TextStyle diffCode = _mono(12, 18, FontWeight.w400, 0);
  static final TextStyle lineNumber = _mono(11, 18, FontWeight.w400, 0);
  static final TextStyle sha = _mono(12, 16, FontWeight.w500, 0.2);
  static final TextStyle filePath = _mono(12, 16, FontWeight.w400, 0);
  static final TextStyle hunkHeader = _mono(11.5, 18, FontWeight.w400, 0);
}
