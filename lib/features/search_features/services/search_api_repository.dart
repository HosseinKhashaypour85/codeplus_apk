import 'package:codeplus/features/search_features/model/search_model.dart';
import 'package:codeplus/features/search_features/services/search_api_services.dart';
import 'package:dio/dio.dart';

class SearchApiRepository {
  final SearchApiServices _apiServices = SearchApiServices();
  Future<SearchModel>callSearchApi()async{
    final Response response = await _apiServices.callSearchApi();
    SearchModel searchModel = SearchModel.fromJson(response.data);
    return searchModel;
  }
}