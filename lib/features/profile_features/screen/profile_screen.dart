import 'package:codeplus/const/shape/border_radius.dart';
import 'package:codeplus/const/shape/media_query.dart';
import 'package:codeplus/const/theme/colors.dart';
import 'package:codeplus/features/auth_features/logic/pref/save_phone_number.dart';
import 'package:codeplus/features/profile_features/widget/LogOutWidget.dart';
import 'package:codeplus/features/profile_features/widget/about_us_widget.dart';
import 'package:codeplus/features/profile_features/widget/drop_down_widget.dart';
import 'package:codeplus/features/profile_features/widget/textFormFieldInfo_widget.dart';
import 'package:codeplus/features/profile_features/widget/user_info_container_widget.dart';
import 'package:codeplus/features/public_features/functions/secure_storage/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String screenId = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary2Color,
      body: SafeArea(
        child: Column(
          children: [
            UserInfoContainerWidget(),
            TextFormFieldInfoWidget(),
            AboutUsWidget(
              title: 'درباره ما',
              onTap: () async{
                final url = 'https://hosseinkhashaypour.ir';
                if(await canLaunchUrlString(url)){
                  launchUrlString(url);
                }
              },
            ),
            AboutUsWidget(
              title: 'برقراری ارتباط با ما',
              onTap: () async{
                final url = 'tel:+989120776658';
                if(await canLaunchUrlString(url)){
                  launchUrlString(url);
                }
              },
            ),
            Spacer(),
            LogOutWidget(),
          ],
        ),
      ),
    );
  }
}

