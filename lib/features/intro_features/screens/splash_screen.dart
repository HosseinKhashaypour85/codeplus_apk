import 'dart:async';

import 'package:codeplus/const/responsive.dart';
import 'package:codeplus/const/shape/border_radius.dart';
import 'package:codeplus/const/shape/media_query.dart';
import 'package:codeplus/const/theme/colors.dart';
import 'package:codeplus/features/home_features/screen/home_screen.dart';
import 'package:codeplus/features/public_features/screen/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/splash_content_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String screenId = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateFunc() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          BottomNavBarScreen.screenId,
              (route) => false,
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    navigateFunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary2Color,
      body: Center(
        child: SplashContentWidget(),
      ),
    );
  }
}
