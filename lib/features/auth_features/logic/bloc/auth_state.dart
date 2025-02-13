part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthCompletedState extends AuthState {
  final String? token;
  AuthCompletedState(this.token);
}

class AuthErrorState extends AuthState {
  final ErrorMessageClass errorMessageClass;

  AuthErrorState(this.errorMessageClass);
}

//sign in api
class SignInAuthLoadingState extends AuthLoadingState {}

class SignInAuthCompletedState extends AuthState {
  final String? token;
  SignInAuthCompletedState(this.token);
}

class SignInErrorState extends AuthState {
  final ErrorMessageClass errorMessageClass;

  SignInErrorState(this.errorMessageClass);
}
