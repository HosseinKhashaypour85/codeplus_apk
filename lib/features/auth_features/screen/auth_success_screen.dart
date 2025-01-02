import 'package:codeplus/const/shape/media_query.dart';
import 'package:codeplus/const/theme/colors.dart';
import 'package:codeplus/features/public_features/screen/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/shape/border_radius.dart';

class AuthSuccessScreen extends StatelessWidget {
  const AuthSuccessScreen({super.key});

  static const String screenId = '/auth_success';

  @override
  Widget build(BuildContext context) {
    final String phoneNumber =
        ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: primary2Color,
      body: Center(
        child: Column(
          spacing: 10.sp,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/images/success.png',
              width: getWidth(context, 0.3),
              height: getHeight(context, 0.3),
            ),
            Text(
              'ثبت نام شماره $phoneNumber موفقیت آمیز بود',
              style: TextStyle(
                fontFamily: 'sahel',
                color: Colors.white,
                fontSize: 18.sp,
              ),
            ),
            Text(
              'از پنل کاربری اقدام به ورود به حساب کاربری کنید',
              style: TextStyle(
                fontFamily: 'sahel',
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  fixedSize: Size(
                    getWidth(context, 3.29),
                    getHeight(context, 0.057),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: getBorderRadiusFunc(5),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    BottomNavBarScreen.screenId,
                    (route) => false,
                  );
                },
                child: Text(
                  'بازگشت به پنل کاربری',
                  style: TextStyle(
                    fontFamily: 'sahel',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
