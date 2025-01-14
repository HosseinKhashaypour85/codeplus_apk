part of 'token_check_cubit.dart';

@immutable
abstract class TokenCheckState {}

class TokenCheckInitial extends TokenCheckState {}
class TokenIsLogedState extends TokenCheckState {}
class TokenIsNotLogedState extends TokenCheckState {}
