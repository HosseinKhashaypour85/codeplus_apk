import 'package:bloc/bloc.dart';
import 'package:codeplus/features/profile_features/services/profile_api_repository.dart';
import 'package:codeplus/features/public_features/functions/error/error_message_class.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../public_features/functions/error/error_exception.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileApiRepository repository;

  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<CallProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        final Response response = await repository.getPhoneNumberById(event.id);
        final String phoneNumber = response.data['phoneNumber'];
        emit(ProfileCompletedState(phoneNumber));
      } on DioException catch (e) {
        emit(ProfileErrorState(
          ErrorMessageClass(errorMsg: ErrorExceptions().fromError(e)),
        ));
      }
    });
  }
}
