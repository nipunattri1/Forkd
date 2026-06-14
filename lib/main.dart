import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/app.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => di<AuthBloc>()..add(const AuthEvent.hydrate()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
