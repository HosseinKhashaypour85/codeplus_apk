import 'package:dio/dio.dart';

class ProfileApiServices {
  final Dio _dio = Dio();

  Future<Response> getPhoneNumberById(String id) async {
    try {
      final Response response = await _dio.get(
        'https://hosseinkhashaypour.chbk.app/api/collections/users/records',
        queryParameters: {
          'filter': 'id="$id"',
        },
      );

      if (response.statusCode == 200 && response.data['items'].isNotEmpty) {
        return response.data['items'][0]['phoneNumber'];
      } else {
        throw Exception('User not found');
      }
    } on DioException catch (e) {
      print('Error: ${e.response?.data}');
      print('Status Code: ${e.response?.statusCode}');
      throw Exception('Failed to fetch profile: ${e.message}');
    }
  }
}
