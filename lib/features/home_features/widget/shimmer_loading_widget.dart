import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        margin: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: boxColors,
                          borderRadius: getBorderRadiusFunc(10),
                        ),
                        width: getWidth(context, 0.7),
                        height: getHeight(context, 0.5),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        margin: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: boxColors,
                          borderRadius: getBorderRadiusFunc(10),
                        ),
                        width: getWidth(context, 0.7),
                        height: getHeight(context, 0.5),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        margin: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: boxColors,
                          borderRadius: getBorderRadiusFunc(10),
                        ),
                        width: getWidth(context, 0.7),
                        height: getHeight(context, 0.5),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          margin: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            color: boxColors,
                            borderRadius: getBorderRadiusFunc(10),
                          ),
                          width: getWidth(context, 0.7),
                          height: getHeight(context, 0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
