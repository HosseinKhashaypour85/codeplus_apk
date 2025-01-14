import 'package:codeplus/const/theme/colors.dart';
import 'package:codeplus/features/profile_features/screen/profile_screen.dart';
import 'package:codeplus/features/public_features/functions/secure_storage/secure_storage.dart';
import 'package:codeplus/features/public_features/screen/bottom_nav_bar.dart';
import 'package:codeplus/features/public_features/widget/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';

class LogOutWidget extends StatefulWidget {
  const LogOutWidget({super.key});

  @override
  State<LogOutWidget> createState() => _LogOutWidgetState();
}

class _LogOutWidgetState extends State<LogOutWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          SecureStorageClass().deleteUserToken();
          Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => BottomNavBarScreen(),));
          getSnackBarWidget(context, 'از حساب خارج شدید', Colors.red);
        },
        child: Text(
          'خروج از حساب کاربری',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'sahel',
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
