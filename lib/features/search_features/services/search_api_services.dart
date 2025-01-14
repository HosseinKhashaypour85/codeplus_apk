import 'package:dio/dio.dart';

class SearchApiServices {
  final Dio _dio = Dio();
  Future<Response>callSearchApi()async{
    final Response response = await _dio.get('https://hosseinkhashaypour.chbk.app/api/collections/codeplus_courses/records');
    return response;
  }
}