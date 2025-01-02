import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/responsive.dart';
import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';

class SplashContentWidget extends StatelessWidget {
  const SplashContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: getBorderRadiusFunc(100),
            child: Image.asset(
              'assets/images/logo.jpg',
              width: Responsive.isMobile(context)
                  ? getWidth(context, 0.4)
                  : getWidth(context, 0.8),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            'آموزش برنامه نویسی با کد پلاس',
            style: TextStyle(
              fontFamily: 'vazir',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            'www.codeplus.ir',
            style: TextStyle(
              fontFamily: 'vazir',
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
