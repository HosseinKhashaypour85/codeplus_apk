import 'package:codeplus/features/profile_features/services/profile_api_services.dart';
import 'package:dio/dio.dart';

class ProfileApiRepository {
  final ProfileApiServices _apiServices = ProfileApiServices();
  Future<Response>getPhoneNumberById(String id)async{
    return await _apiServices.getPhoneNumberById(id);
  }
}