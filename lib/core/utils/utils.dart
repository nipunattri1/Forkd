import 'package:fpdart/fpdart.dart';

import 'package:url_launcher/url_launcher.dart';

class StorageKeys {
  static const accounts = 'accounts';
  static const activeAccount = 'default-account';
}

Future<Either<Exception, void>> launchUri(Uri uri) async {
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    return Either.right(null);
  } else {
    return Either.left(Exception('cant launch the uri'));
  }
}
