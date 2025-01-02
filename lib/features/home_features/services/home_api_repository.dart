import 'package:codeplus/features/home_features/model/home_model.dart';
import 'package:codeplus/features/home_features/services/home_api_services.dart';
import 'package:dio/dio.dart';

class HomeApiRepository {
  final HomeApiServices _apiServices = HomeApiServices();
  Future<HomeModel>callHomeApi()async{
    final Response response = await _apiServices.callHomeApi();
    HomeModel homeModel = HomeModel.fromJson(response.data);
    return homeModel;
  }
}