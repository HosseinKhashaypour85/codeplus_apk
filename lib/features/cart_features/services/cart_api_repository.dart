import 'package:codeplus/features/cart_features/model/cart_model.dart';
import 'package:codeplus/features/cart_features/services/cart_api_services.dart';
import 'package:dio/dio.dart';

import '../model/show_cart_model.dart';

class CartApiRepository {
  final CartApiServices _apiServices = CartApiServices();

  //  add product to cart
  Future<CartModel> callAddToCartApi(String id, String image, int count,
      String title, int price, bool checkCart) async {
    final Response response = await _apiServices.callAddToCartApi(
        id, image, count, title, price, checkCart);
    CartModel cartModel = CartModel.fromJson(response.data);
    return cartModel;
  }

//   show product
  Future<ShowCartModel> callShowProductApi() async {
    final Response response = await _apiServices.callShowProductApi();
    ShowCartModel showCartModel = ShowCartModel.fromJson(response.data);
    return showCartModel;
  }

//   delete product
  Future<void> callDeleteProductApi(String id) async {
    await _apiServices.callDeleteProductApi(id);
  }
}
