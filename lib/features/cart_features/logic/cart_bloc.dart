import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codeplus/features/cart_features/model/cart_model.dart';
import 'package:codeplus/features/cart_features/model/show_cart_model.dart';
import 'package:codeplus/features/cart_features/services/cart_api_repository.dart';
import 'package:codeplus/features/public_features/functions/error/error_message_class.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../public_features/functions/error/error_exception.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartApiRepository repository;

  CartBloc(this.repository) : super(CartInitial()) {
    on<AddToCartEvent>(_addToCart);
    on<CallShowCart>(_showCart);
    on<CallDeleteProduct>(_deleteCart);
  }

  // متد برای اضافه کردن به سبد خرید
  FutureOr<void> _addToCart(
      AddToCartEvent event, Emitter<CartState> emit) async {
    emit(AddToCartLoadingState());
    try {
      CartModel cartModel = await repository.callAddToCartApi(
        event.id,
        event.image,
        event.count!,
        event.title,
        event.price,
        event.checkCart,
      );
      emit(AddToCartCompletedState(cartModel));
    } on DioException catch (e) {
      emit(AddToCartErrorState(
        error: ErrorMessageClass(errorMsg: ErrorExceptions().fromError(e)),
      ));
    }
  }

  FutureOr<void> _showCart(CallShowCart event, Emitter<CartState> emit) async {
    emit(ShowCartLoadingState());
    try {
      ShowCartModel showCartModel = await repository.callShowProductApi();
      double totalPrice = 0;
      for(var product in showCartModel.items!){
        totalPrice += product.price?.toDouble() ?? 0;
      }
      emit(ShowCartCompletedState(showCartModel , totalPrice));
    } catch (e) {
      emit(ShowCartErrorState(
        error: ErrorMessageClass(errorMsg: e.toString()),
      ));
    }
  }

  FutureOr<void> _deleteCart(
      CallDeleteProduct event, Emitter<CartState> emit) async {
    emit(DeleteProductLoadingState());
    try {
      await repository.callDeleteProductApi(event.id);
      ShowCartModel showCartModel = await repository.callShowProductApi();
      double totalPrice = 0;
      for(var product in showCartModel.items!){
        totalPrice += product.price?.toDouble() ?? 0;
      }
      emit(ShowCartCompletedState(showCartModel , totalPrice));
    } catch (e) {
      emit(ShowCartErrorState(
        error: ErrorMessageClass(errorMsg: e.toString()),
      ));
    }
  }
}
