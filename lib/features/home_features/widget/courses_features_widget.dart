import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';

class CoursesFeaturesWidget extends StatelessWidget {
  const CoursesFeaturesWidget(
      {super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column( // استفاده از Column برای قرار دادن ویجت‌ها به صورت عمودی
      children: [
        CoursesFeaturesItemsWidget(icon: icon, title: title),
      ],
    );
  }
}

class CoursesFeaturesItemsWidget extends StatelessWidget {
  const CoursesFeaturesItemsWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getAllWidth(context),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: getBorderRadiusFunc(10),
      ),
      padding: EdgeInsets.all(13.sp),
      margin: EdgeInsets.all(10.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30.sp,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'sahel',
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}