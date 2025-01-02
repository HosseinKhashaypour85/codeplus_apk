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

    return GestureDetector(
      onDoubleTap: () {
        print('hi');
      },
      child: Container(
        width: Responsive.isMobile(context)
            ? getAllWidth(context)
            : getAllWidth(context),
        height: (getAllHeight(context) - getWidth(context, 0.8))
            .clamp(0, double.infinity), // Ensure height is valid
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final helper = items[index];
            return Container(
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
                            child: Image.network(
                              helper.imageUrl ?? '',
                              width: Responsive.isMobile(context)
                                  ? getAllWidth(context) - 50
                                  : getAllWidth(context),
                              fit: BoxFit.fitWidth,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error, color: Colors.red);
                              },
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
                        // Handle null safety
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
                        // Ensure valid width
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: getBorderRadiusFunc(5),
                      ),
                    ),
                    onPressed: () {
                      // Go to more info page
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
            );
          },
        ),
      ),
    );
  }
}
