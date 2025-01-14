import 'package:codeplus/features/cart_features/logic/cart_bloc.dart';
import 'package:codeplus/features/cart_features/model/cart_model.dart';
import 'package:codeplus/features/cart_features/services/cart_api_repository.dart';
import 'package:codeplus/features/public_features/functions/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';
import '../../../features/public_features/functions/category_selector/category_selector.dart';
import '../../../features/public_features/functions/number_to_three/number_to_three.dart';
import '../../../features/public_features/logic/token_checker/token_check_cubit.dart';
import '../../../features/public_features/screen/bottom_nav_bar.dart';
import '../../../features/public_features/widget/snack_bar_widget.dart';

class CoursesInfoScreen extends StatefulWidget {
  const CoursesInfoScreen({super.key});

  static const String screenId = '/courses_info';

  @override
  State<CoursesInfoScreen> createState() => _CoursesInfoScreenState();
}

class _CoursesInfoScreenState extends State<CoursesInfoScreen> {
  List<CartModel> cartModel = [CartModel(checkCart: false)];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: primary2Color,
      appBar: AppBar(
        backgroundColor: primary2Color,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                BottomNavBarScreen.screenId,
                    (route) => false,
              );
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: getBorderRadiusFunc(10),
                    child: Image.network(
                      arguments['imageUrl'] ?? '',
                      fit: BoxFit.cover,
                      width: getWidth(context, 0.8),
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        arguments['courseName'] ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'sahel',
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'دسته بندی : ${setCategoryById(
                          (arguments['category'] as List<String>?)?.first ??
                              'نامشخص',
                        )}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'sahel',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'قیمت دوره : ${getFormatPrice(arguments['coursePrice']?.toString() ?? '')} تومان',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'sahel',
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    margin: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: getBorderRadiusFunc(10),
                    ),
                    child: Text(
                      arguments['description'] ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sahel',
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.sp),
            BlocConsumer<CartBloc, CartState>(
              builder: (context, state) {
                if (state is AddToCartLoadingState) {
                  return SizedBox.shrink();
                }
                return SizedBox.shrink();
              },
              listener: (context, state) {
                if (state is AddToCartCompletedState) {
                  getSnackBarWidget(context, 'محصول به سبد خرید اضافه شد', Colors.green);
                  state.cartModel.checkCart = true;
                }
                if (state is AddToCartErrorState) {
                  getSnackBarWidget(context, 'محصول در سبد خرید هست!', Colors.red);
                }
              },
            ),
            BlocBuilder<TokenCheckCubit, TokenCheckState>(
              builder: (context, state) {
                if (state is TokenIsLogedState) {
                  if (cartModel.first.checkCart == true) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: boxColors,
                        fixedSize: Size(getWidth(context, 3.29),
                            getHeight(context, 0.057)),
                        shape: RoundedRectangleBorder(
                          borderRadius: getBorderRadiusFunc(5),
                        ),
                      ),
                      onPressed: null,
                      child: Text(
                        'محصول در سبد خرید',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontFamily: 'sahel',
                        ),
                      ),
                    );
                  } else {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: Size(getWidth(context, 3.29),
                            getHeight(context, 0.057)),
                        shape: RoundedRectangleBorder(
                          borderRadius: getBorderRadiusFunc(5),
                        ),
                      ),
                      onPressed: () {
                        BlocProvider.of<CartBloc>(context).add(AddToCartEvent(
                          id: arguments['id'],
                          token: arguments['courseName'],
                          image: arguments['imageUrl'],
                          count: 1,
                          title: arguments['courseName'],
                          price: arguments['coursePrice'],
                          checkCart: true,
                        ));
                      },
                      child: Text(
                        'افزودن به سبد خرید',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontFamily: 'sahel',
                        ),
                      ),
                    );
                  }
                }
                if (state is TokenIsNotLogedState) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: Size(
                          getWidth(context, 3.29), getHeight(context, 0.057)),
                      shape: RoundedRectangleBorder(
                        borderRadius: getBorderRadiusFunc(5),
                      ),
                    ),
                    onPressed: () {
                      getSnackBarWidget(
                          context, 'وارد حساب کاربری شوید', Colors.red);
                    },
                    child: Text(
                      'وارد حساب کاربری شوید',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontFamily: 'sahel',
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink(); // مقدار پیش‌فرض
              },
            ),
          ],
        ),
      ),
    );
  }
}
