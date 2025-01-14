import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';
class UserInfoContainerWidget extends StatefulWidget {
  const UserInfoContainerWidget({super.key});

  @override
  State<UserInfoContainerWidget> createState() => _UserInfoContainerWidgetState();
}

class _UserInfoContainerWidgetState extends State<UserInfoContainerWidget> {
  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    _loadNumber();
  }

  void _loadNumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? savedPhoneNumber = pref.getString('phone_number');
    setState(() {
      phoneNumber = savedPhoneNumber!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.all(10.sp),
      width: getAllWidth(context),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: getBorderRadiusFunc(10),
      ),
      child: Column(
        spacing: 5.sp,
        children: [
          CircleAvatar(
            radius: getWidth(context, 0.07),
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: primaryColor,
              size: 30.sp,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: Text(
              'کاربر گرامی$phoneNumber',
              style: TextStyle(
                  fontFamily: 'sahel',
                  color: Colors.white,
                  fontSize: 17.sp
              ),
            ),
          ),
        ],
      ),
    );;
  }
}



