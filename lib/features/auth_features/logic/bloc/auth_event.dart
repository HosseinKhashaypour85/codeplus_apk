part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CallAuthEvent extends AuthEvent {
  final String? phoneNumber;
  final String? password;
  final String? passwordConfirm;

  CallAuthEvent(
    this.phoneNumber,
    this.password,
    this.passwordConfirm,
  );
}

class CallSignInAuthEvent extends AuthEvent {
  final String? phoneNumber;
  final String? password;

  CallSignInAuthEvent(this.phoneNumber, this.password);
}
