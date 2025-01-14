import 'package:dio/dio.dart';

//Api for sign up
class AuthApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );

  Future<Response> callSignUpApi(
      String phoneNumber, String password, String confirmPassword) async {
    try {
      final Response response = await _dio.post(
        'https://hosseinkhashaypour.chbk.app/api/collections/users/records',
        data: {
          'password': password,
          'passwordConfirm': confirmPassword,
          'username': phoneNumber,
        },
      );
      return response;
    } on DioException catch (e) {
      print('Error: ${e.response?.data}');
      print('Status Code: ${e.response?.statusCode}');
      throw e;
    }
  }

//   sign in api
  Future<Response> callSignInApi(String phoneNumber, String password) async {
    try {
      final Response response = await _dio.post(
        'https://hosseinkhashaypour.chbk.app/api/collections/users/auth-with-password',
        data: {
          'identity': phoneNumber,
          'password': password,
        },
      );
      return response;
    } on DioException catch (e) {
      print('Error: ${e.response?.data}');
      print('Status Code: ${e.response?.statusCode}');
      throw Exception('خطا در ورود: ${e.message}');
    }
  }
}
