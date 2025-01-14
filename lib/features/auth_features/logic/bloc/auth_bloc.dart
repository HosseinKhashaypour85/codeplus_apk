import 'package:bloc/bloc.dart';
import 'package:codeplus/features/auth_features/services/auth_api_repository.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../public_features/functions/error/error_exception.dart';
import '../../../public_features/functions/error/error_message_class.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthApiRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<CallAuthEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          final Response response = await repository.callSignUpApi(
            event.phoneNumber!,
            event.password!,
            event.passwordConfirm!
          );
          final String? token = response.data['token'];
          emit(AuthCompletedState(token));
        } on DioException catch (e) {
          emit(AuthErrorState(
            ErrorMessageClass(errorMsg: ErrorExceptions().fromError(e)),
          ));
        }
      },
    );
    on<CallSignInAuthEvent>((event, emit) async {
      if (event.phoneNumber == null || event.phoneNumber!.isEmpty) {
        emit(AuthErrorState(
            ErrorMessageClass(errorMsg: "Phone number cannot be empty")));
        return;
      }
      if (event.password == null || event.password!.isEmpty) {
        emit(AuthErrorState(
            ErrorMessageClass(errorMsg: "Password cannot be empty")));
        return;
      }

      emit(AuthLoadingState());
      try {
        final Response response =
            await repository.callSignInApi(event.phoneNumber!, event.password!);
        final String? token = response.data['token'];
        emit(SignInAuthCompletedState(token));
      } on DioException catch (e) {
        emit(AuthErrorState(
          ErrorMessageClass(errorMsg: ErrorExceptions().fromError(e)),
        ));
      }
    });
  }
}
