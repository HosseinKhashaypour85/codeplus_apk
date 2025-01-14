import 'package:codeplus/features/public_features/functions/secure_storage/secure_storage.dart';
import 'package:dio/dio.dart';

class CartApiServices {
  final Dio _dio = Dio();

  // add product
  Future<Response> callAddToCartApi(String id, String image, int count,
      String title, int price, bool checkCart) async {
    final token = await SecureStorageClass().getUserToken();
    final Response response = await _dio.post(
        'https://hosseinkhashaypour.chbk.app/api/collections/codeplus_cart/records',
        data: {
          'id': id,
          'token': token,
          'image': image,
          'count': count,
          'title': title,
          'price': price,
          'isInBasket': checkCart,
        });
    return response;
  }

//   show product
  Future<Response> callShowProductApi() async {
    final Response response = await _dio.get(
        'https://hosseinkhashaypour.chbk.app/api/collections/codeplus_cart/records');
    return response;
  }

//   delete product
  Future<Response> callDeleteProductApi(String id) async {
    final Response response = await _dio.delete(
      'https://hosseinkhashaypour.chbk.app/api/collections/codeplus_cart/records/$id',
    );
    return response;
  }
}
