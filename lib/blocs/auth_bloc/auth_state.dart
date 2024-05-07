import 'package:flutterstates/models/session.dart';

class AuthState {
  Session? session;
  bool isLoading = false;

  AuthState({
    this.session,
    this.isLoading = false,
  });

  AuthState copyWith({
    Session? session,
    bool? isLoading,
  }) {
    return AuthState(
      session: session ?? this.session,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
