import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/data/datasource/forkd_accounts.dart';
import 'package:forkd/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:forkd/features/auth/presentation/views/login.dart';
import 'package:forkd/features/dashboard/persentation/views/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

Future<String?> _authGuard(BuildContext context, GoRouterState state) async {
  final isLogedIn = await di<ForkdAccountsDataSource>().isLogedIn;
  final isGoingToLogin = state.matchedLocation == '/login';
  final isHandlingAuth = state.matchedLocation.startsWith('/auth');

  final logger = di<Logger>()
    ..d({
      'info': 'Auth Guard State Check',
      'isLoggedIn': isLogedIn,
      'isGoingToLogin': isGoingToLogin,
      'isHandlingAuth': isHandlingAuth,
    });

  if (!isLogedIn) {
    if (isHandlingAuth) {
      logger.d(
        'User unauthenticated, but processing deep link. Allowing entry.',
      );
      return null;
    }
    return isGoingToLogin ? null : '/login?from=${state.matchedLocation}';
  }

  // If they are logged in but trying to view /login or the /auth/gitlab loading screen, kick them to home
  if (isGoingToLogin || isHandlingAuth) {
    logger.i(
      'User already authenticated. Redirecting away from auth pages to home (/).',
    );
    return '/';
  }

  return null;
}

class StreamToListenable<T> extends ChangeNotifier {
  StreamToListenable(List<Stream<T>> streams) {
    subscriptions = [];
    for (final e in streams) {
      final s = e.asBroadcastStream().listen(_tt);
      subscriptions.add(s);
    }
    notifyListeners();
  }
  late final List<StreamSubscription<T>> subscriptions;

  @override
  Future<void> dispose() async {
    for (final e in subscriptions) {
      await e.cancel();
    }
    super.dispose();
  }

  void _tt(dynamic event) => notifyListeners();
}

final router = GoRouter(
  initialLocation: '/',
  redirect: _authGuard,
  refreshListenable: StreamToListenable([di<AuthBloc>().stream]),
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const AddAccountScreen(),
    ),
    GoRoute(
      path: '/auth/gitlab',
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Authenticating with GitLab...'),
              ],
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
