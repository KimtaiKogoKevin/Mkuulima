import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/User.dart';
import '../../repositories/authentication/auth_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;
  AuthBloc({required AuthRepository authRepository ,}): _authRepository = authRepository ,super( const AuthState.unauthenticated()){
    on<AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);


  }
  void _onUserChanged(
      AuthUserChanged event,
      Emitter<AuthState> emit,

      ) {
    emit(event.user.isNotEmpty?AuthState.authenticated(event.user): const AuthState.unauthenticated());
  }

  void _onLogoutRequested(
      AuthLogoutRequested event,
      Emitter<AuthState> emit,

      ) {
       unawaited(_authRepository.logout());
  }
}