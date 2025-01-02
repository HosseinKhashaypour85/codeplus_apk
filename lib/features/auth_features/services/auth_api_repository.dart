import 'package:codeplus/features/auth_features/services/auth_api_services.dart';
import 'package:dio/dio.dart';

class AuthApiRepository {
  // sign up api repository
  final AuthApiServices _apiServices = AuthApiServices();
  Future<Response> callSignUpApi(String phoneNumber, String password, String confirmPassword) async {
    return await _apiServices.callSignUpApi(phoneNumber, password, confirmPassword);
  }
  // sign in api repository

  Future<Response>callSignInApi(String phoneNumber , String password)async{
    return await _apiServices.callSignInApi(phoneNumber, password);
  }
}
