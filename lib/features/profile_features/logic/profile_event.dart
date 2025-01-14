part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class CallProfileEvent extends ProfileEvent{
  final String id;
  CallProfileEvent(this.id);
}
