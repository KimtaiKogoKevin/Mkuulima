import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/User.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super( AuthState.unauthenticated()){
    on<AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequested>(_onLogoutRequested);


  }
  void _onUserChanged(
      AuthUserChanged event,
      Emitter<AuthState> emit,

      ) {}

  void _onLogoutRequested(
      AuthLogoutRequested event,
      Emitter<AuthState> emit,

      ) {}
}