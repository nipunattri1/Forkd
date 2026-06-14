import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/core/router/router.dart';
import 'package:forkd/core/theme/forkd_theme.dart';
import 'package:forkd/core/widgets/forkd_toasts.dart';
import 'package:forkd/features/auth/presentation/bloc/auth_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: router,
          theme: ForkdTheme.lightTheme,
          darkTheme: ForkdTheme.darkTheme,
        );
      },
      listener: (context, state) {
        state.mapOrNull(
          error: (error) {
            ForkdToasts.error(
              error.error,
              context: context,
              message: error.error,
            );
          },
        );
      },
    );
  }
}
