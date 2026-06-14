import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forkd/core/networking/networking_helpers.dart';
import 'package:forkd/dependency_injection.dart';
import 'package:forkd/features/auth/domain/entities/account_entity.dart';
import 'package:forkd/features/auth/domain/usecase/add_gitlab_oauth_account_usecase.dart';
import 'package:forkd/features/auth/domain/usecase/add_gitlab_token_account_usecase.dart';
import 'package:forkd/features/auth/domain/usecase/hydrate_auth_usecase.dart';
import 'package:forkd/features/auth/domain/usecase/remove_forkd_account_usecase.dart';
import 'package:forkd/features/auth/domain/usecase/set_active_forkd_account_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    // required this.addGithubAccountUseCase,
    required this.addGitlabOAuthAccountUseCase,
    required this.removeForkdAccountUseCase,
    required this.hydrateAuthUseCase,
    required this.setActiveForkdAccountUsecase,
    required this.addGitlabTokenAccountUsecase,
    required this.logger,
  }) : super(const AuthState.loading()) {
    on<_AddGithubAccountEvent>(_addGithubAccount);

    on<_AddGitlabOAuthAccountEvent>(_addOAuthGitlab);
    on<_AddGitlabTokenAccountEvent>(_addTokenGitlab);

    on<_HydarateAuth>(_hydrateAuth);
    on<_RemoveForkdAccountEvent>(_removeForkdAccount);
    on<_SetActiveAccountEvent>(_setActiveAccount);
  }

  // final AddGithubAccountUseCase addGithubAccountUseCase;

  final AddGitlabOAuthAccountUseCase addGitlabOAuthAccountUseCase;
  final AddGitlabTokenAccountUsecase addGitlabTokenAccountUsecase;
  final RemoveForkdAccountUseCase removeForkdAccountUseCase;
  final HydrateAuthUseCase hydrateAuthUseCase;
  final SetActiveForkdAccountUsecase setActiveForkdAccountUsecase;
  final Logger logger;

  Future<void> _addGithubAccount(
    _AddGithubAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    logger.e('Trying an Unimplemented method');
    throw UnimplementedError();
    // emit(AuthState.loading());
    // final res = await addGithubAccountUseCase(NoParams());
    // res.match((_) => emit(AuthState.error(error: "Couldn't add Account")), (
    //   _,
    // ) async {
    //   final result = await hydrateAuthUseCase();
    //   emit(
    //     AuthState.data(
    //       accounts: result.accounts,
    //       activeAccount: result.activeAccount,
    //     ),
    //   );
    // });
  }

  Future<void> _removeForkdAccount(
    _RemoveForkdAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final res = await removeForkdAccountUseCase(event.account);
    res.match(
      (_) => emit(const AuthState.error(error: "Couldn't remove Account")),
      (
        _,
      ) async {
        final result = await hydrateAuthUseCase.call();

        emit(
          AuthState.data(
            accounts: result.accounts,
            activeAccount: result.activeAccount,
          ),
        );
      },
    );
  }

  Future<void> _hydrateAuth(
    _HydarateAuth event,
    Emitter<AuthState> emit,
  ) async {
    di<Logger>().d('hyrating');
    final result = await hydrateAuthUseCase.call();
    // Uri.https(result.activeAccount?.domain ?? '').;
    NetworkingHelpers.configureDio(
      domain: 'https://${result.activeAccount?.domain}',
    );

    logger.d({
      'info': 'Hyadrating the App with data',
      'accounts': result.accounts,
      'activeAccount': result.activeAccount,
    });
    emit(
      AuthState.data(
        accounts: result.accounts,
        activeAccount: result.activeAccount,
      ),
    );
  }

  Future<void> _addOAuthGitlab(
    _AddGitlabOAuthAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await addGitlabOAuthAccountUseCase(
      AddGitlabOAuthAccountParams(domain: event.domain),
    );
    await res.fold(
      (e) async {
        logger.e({'info': 'gitlab OAuth failed with error'}, error: e);
        emit(const AuthState.error(error: "Couldn't add Account"));
      },
      (_) async {
        final result = await hydrateAuthUseCase.call();
        logger.d({
          'info': 'OAuth Emitting data',
          'accounts': result.accounts,
          'Active Account': result.activeAccount,
        });
        emit(
          AuthState.data(
            accounts: result.accounts,
            activeAccount: result.activeAccount,
          ),
        );
      },
    );
  }

  Future<void> _setActiveAccount(
    _SetActiveAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    di<Logger>().d('setting active accout');
    final res = await setActiveForkdAccountUsecase.call(event.account);
    await res.fold(
      (e) async => emit(const AuthState.error(error: "Couldn't Set Account")),
      (_) async {
        di<Logger>().d('set Success');
        final result = await hydrateAuthUseCase.call();
        emit(
          AuthState.data(
            accounts: result.accounts,
            activeAccount: result.activeAccount,
          ),
        );
      },
    );
  }

  Future<void> _addTokenGitlab(
    _AddGitlabTokenAccountEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await addGitlabTokenAccountUsecase.call(
      AddGitlabTokenAccountParams(token: event.token, domain: event.domain),
    );
    await res.fold(
      (e) async => emit(const AuthState.error(error: 'Coudn;t add account')),
      (_) async {
        di<Logger>().d('set Success');
        final result = await hydrateAuthUseCase.call();
        emit(
          AuthState.data(
            accounts: result.accounts,
            activeAccount: result.activeAccount,
          ),
        );
      },
    );
  }
}
