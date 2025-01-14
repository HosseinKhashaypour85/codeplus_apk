part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileCompletedState extends ProfileState {
  final String phoneNumber;
  ProfileCompletedState(this.phoneNumber);
}

class ProfileErrorState extends ProfileState {
  final ErrorMessageClass errorMessageClass;
  ProfileErrorState(this.errorMessageClass);
}
