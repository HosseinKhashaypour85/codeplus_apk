import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final courseDescription =
        'دوره‌های آموزشی ما برای افرادی طراحی شده که می‌خواهند برنامه‌نویسی را به‌صورت سریع و مؤثر یاد بگیرند. این دوره‌ها شامل آموزش‌های پروژه‌محور در زبان‌های مختلف مانند HTML، CSS، JavaScript و Flutter هستند که به شما کمک می‌کنند مهارت‌های برنامه‌نویسی خود را از پایه تا پیشرفته توسعه دهید. با پشتیبانی دائمی و منابع آموزشی کامل، شما می‌توانید در کمترین زمان ممکن به یک برنامه‌نویس حرفه‌ای تبدیل بشید و وارد بازار کار بشید.';
    final secondDescription =
        'توی این دوره ها شما به هیچ پیش نیازی احتیاج ندارید فقط تنها چیزی که نیاز دارید یک سیستم نسبتا عادی هست. ';
    return Column(
      children: [
        Container(
          width: getAllWidth(context),
          padding: EdgeInsets.all(10.sp),
          margin: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: getBorderRadiusFunc(
              10,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'آموزش برنامه نویسی با ',
                      style: TextStyle(
                        fontFamily: 'vazir',
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      'کدپلاس',
                      style: TextStyle(
                        fontFamily: 'vazir',
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Text(
                  courseDescription,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sahel',
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Text(
                  secondDescription,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sahel',
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
