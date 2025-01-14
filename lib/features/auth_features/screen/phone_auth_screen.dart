import 'package:codeplus/const/theme/colors.dart';
import 'package:codeplus/features/auth_features/screen/auth_screen.dart';
import 'package:codeplus/features/auth_features/screen/auth_success_screen.dart';
import 'package:codeplus/features/public_features/screen/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';
import '../widget/activation_code_widget.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  static const String screenId = '/phone_auth';

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String phoneNumber =
    ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: primary2Color,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30.sp,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'کد فعالسازی را وارد کنید ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'sahel',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'کد فعالسازی وارد شده به شماره $phoneNumber را وارد کنید',
                          style: TextStyle(
                            color: boxColors,
                            fontSize: 15.sp,
                            fontFamily: 'sahel',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, BottomNavBarScreen.screenId);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'تغییر شماره همراه',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.sp,
                              fontFamily: 'sahel',
                            ),
                          ),
                        ),
                      ),
                      // فرم برای ورودی‌ها
                      Form(
                        key: formKey,
                        child: ActivationCodeWidget(
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
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
                if (formKey.currentState!.validate()) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AuthSuccessScreen.screenId,
                        (route) => false,
                    arguments: phoneNumber,
                  );
                }
              },
              child: Text(
                'مرحله بعد',
                style: TextStyle(
                  fontFamily: 'sahel',
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

