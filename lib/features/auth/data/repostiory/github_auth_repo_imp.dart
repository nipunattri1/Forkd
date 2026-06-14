// import 'dart:async';

// import 'package:app_links/app_links.dart';
// import 'package:forkd/core/common/strings.dart';
// import 'package:forkd/features/auth/data/models/token.dart';
// import 'package:forkd/features/auth/domain/entities/account_entity.dart';
// import 'package:forkd/features/auth/domain/repositories/github_auth_repo.dart';
// import 'package:forkd/features/auth/data/datasource/github.dart';
// import 'package:forkd/core/utils/utils.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:nanoid/nanoid.dart';
// import 'package:url_launcher/url_launcher.dart';

// class GithubAuthRepoImp implements GithubAuthRepo {
//   GithubAuthRepoImp({
//     required GithubDataSource dataSource,
//     required AppLinks appLinks,
//   }) : _appLinks = appLinks,
//        _dataSource = dataSource;

//   final GithubDataSource _dataSource;
//   final AppLinks _appLinks;

//   // TODO: add token val conversion
//   @override
//   Future<Either<Exception, (AccountEntity, TokenModel)>> loginWithToken(String token) async {
//     try {
//       final account = await _dataSource.loginWithToken(token);
//       return Either.right(account);
//     } on Exception catch (e, _) {
//       return Either.left(e);
//     }
//   }

//   @override
//   Future<Either<Exception, AccountEntity>> loginWithOAuth() async {
//     final localOAuthState = nanoid();
//     final completer = Completer<Either<Exception, AccountEntity>>();
//     Timer? timeoutTimer;
//     StreamSubscription<Uri>? linkSubscription;
//     void cleanUpAndComplete(Either<Exception, AccountEntity> result) {
//       timeoutTimer?.cancel();
//       if (!completer.isCompleted) {
//         completer.complete(result);
//       }
//       linkSubscription?.cancel();
//     }

//     // timeout after 5 minutes
//     timeoutTimer = Timer(const Duration(minutes: 5), () {
//       cleanUpAndComplete(Either.left(Exception('OAuth login timed out.')));
//     });

//     linkSubscription = _appLinks.uriLinkStream.listen(
//       (uri) async {
//         if (uri.scheme == appUriScheme && uri.host == appUriBase) {
//           linkSubscription?.cancel();
//           final code = uri.queryParameters['code'];
//           final state = uri.queryParameters['state'];
//           if (code == null || state != localOAuthState) {
//             cleanUpAndComplete(
//               Either.left(Exception('Invalid OAuth callback.')),
//             );
//             return;
//           }

//           try {
//             try {
//               await closeInAppWebView();
//             } catch (_) {} // should not block token exchange
//             final token = await _dataSource.exchangeTokens(
//               code: code,
//               oAuthState: localOAuthState,
//             );
//             final accountResult = await loginWithToken(token);
//             cleanUpAndComplete(accountResult);
//           } on Exception catch (e) {
//             cleanUpAndComplete(Either.left(e));
//           }
//         }
//       },
//       onError: (Object err) {
//         cleanUpAndComplete(Either.left(Exception(err.toString())));
//       },
//     );

//     try {
//       final uri = Uri.parse(
//         'https://$githubUrlBase$githubOAuthPath?client_id=$clientId&redirect_uri=$appUriScheme://$appUriBase/login&state=$localOAuthState',
//       );
//       await launchUri(uri);
//     } catch (e) {
//       cleanUpAndComplete(
//         Either.left(Exception('Failed to launch browser: $e')),
//       );
//     }
//     return completer.future;
//   }
// }
