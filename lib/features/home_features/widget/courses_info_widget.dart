import 'package:codeplus/features/courses_widget/screen/courses_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/responsive.dart';
import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';
import '../../public_features/functions/category_selector/category_selector.dart';
import '../model/home_model.dart';

class CoursesInfoWidget extends StatelessWidget {
  const CoursesInfoWidget({super.key, required this.homeModel});

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {


    final items = homeModel.items ?? [];

    return Container(
      width: getAllWidth(context),
      height: getHeight(context, 0.62),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final helper = items[index];
          final String courseId = helper.id ?? 'unknown';
          final String imageUrl = helper.imageUrl ?? 'no image';
          final String description = helper.description ?? 'no desc';
          final String courseName = helper.courseName ?? 'no name';
          final dynamic category = helper.category ?? 'no catgory';
          final Object price = helper.coursePrice ?? 'no price';
          final bool? isInBasket = helper.checkCart;
          return GestureDetector(
            onDoubleTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                CoursesInfoScreen.screenId,
                    (route) => false,
                arguments: {
                  'id': courseId,
                  'imageUrl' : imageUrl,
                  'description' : description,
                  'category' : category,
                  'courseName' : courseName,
                  'coursePrice' : price,
                  'CheckCart' : isInBasket ,
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10.sp),
              margin: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                borderRadius: getBorderRadiusFunc(10),
                color: boxColors,
              ),
              width: getWidth(context, 0.7),
              child: Column(
                children: [
                  helper.courseImage != null
                      ? Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: ClipRRect(
                      borderRadius: getBorderRadiusFunc(10),
                      child: FadeInImage(
                        width: Responsive.isMobile(context)
                            ? getAllWidth(context) - 50
                            : getAllWidth(context),
                        fit: BoxFit.fitWidth,
                        placeholder: AssetImage('assets/images/logo.jpg'),
                        image: NetworkImage(
                          helper.imageUrl ?? '',
                        ),
                      ),
                    ),
                  )
                      : Icon(Icons.error),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      helper.courseName ?? 'بدون نام',
                      style: TextStyle(
                        fontFamily: 'sahel',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'دسته بندی :',
                          style: TextStyle(
                            fontFamily: 'sahel',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17.sp,
                          ),
                        ),
                      ),
                      Text(
                        setCategoryById(helper.category?[0] ?? 'نامشخص'),
                        style: TextStyle(
                          fontFamily: 'sahel',
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      fixedSize: Size(
                        getAllWidth(context).clamp(0, double.infinity),
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: getBorderRadiusFunc(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        CoursesInfoScreen.screenId,
                            (route) => false,
                        arguments: {
                          'id': courseId,
                          'imageUrl' : imageUrl,
                          'description' : description,
                          'courseName' : courseName,
                          'category' : category,
                          'coursePrice' : price,
                          'CheckCart' : isInBasket ,

                        },
                      );
                    },
                    child: Text(
                      'مشاهده دوره',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sahel',
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
