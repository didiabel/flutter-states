import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  const SignInEvent({required this.email, required this.password});
}

class SignOutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  const SignUpEvent({required this.email, required this.password});
}

class RecoverPasswordEvent extends AuthEvent {
  final String email;
  final String password;
  final String code;

  @override
  List<Object?> get props => [email, password, code];

  const RecoverPasswordEvent(
      {required this.email, required this.password, required this.code});
}

class SendForgotEmailEvent extends AuthEvent {
  final String email;
  @override
  List<Object?> get props => [email];

  const SendForgotEmailEvent({required this.email});
}
