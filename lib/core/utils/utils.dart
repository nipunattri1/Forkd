import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';

import 'package:url_launcher/url_launcher.dart';

export 'extensions.dart';

class StorageKeys {
  static const accounts = 'accounts';
  static const iBrightness = 'brightness';
  static const codeTheme = 'code-theme';
  static const codeThemeDark = 'code-theme-dark';
  static const iCodeFontSize = 'code-font-size';
  static const codeFontFamily = 'code-font-family';
  static const iMarkdown = 'markdown';
  static const activeAccount = 'default-account';
  static const locale = 'locale';

  static String getDefaultStartTabKey(String platform) =>
      'default-start-tab-$platform';
}

Future<Either<Exception, void>> launchUri(Uri uri) async {
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    return Either.right(null);
  } else {
    return Either.left(Exception('cant launch the uri'));
  }
}
