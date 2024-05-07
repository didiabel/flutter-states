import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterstates/blocs/auth_bloc/auth_event.dart';
import 'package:flutterstates/blocs/auth_bloc/auth_state.dart';
import 'package:flutterstates/models/session.dart';
import 'package:flutterstates/models/user.dart';
import 'package:flutterstates/services/core/injector.dart';
import 'package:flutterstates/services/interfaces/iauth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  IAuthService _authService = Injector.resolve<IAuthService>();

  AuthBloc() : super(AuthState()) {
    on<SignInEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      // final user = await _authService.signIn(event.email, event.password);
      await Future.delayed(const Duration(seconds: 2));

      final session = Session(
        user: User(id: '1', username: event.email, email: 'Jhon@doe'),
        token: '1234567890',
      );

      emit(state.copyWith(session: session, isLoading: false));
    });

    on<SignOutEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(session: null, isLoading: false));
    });
  }
}
