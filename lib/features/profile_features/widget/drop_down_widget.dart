import 'package:codeplus/const/shape/border_radius.dart';
import 'package:codeplus/const/shape/media_query.dart';
import 'package:codeplus/const/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String _selectedValue = 'none';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      margin: EdgeInsets.all(10.sp),
      width: getAllWidth(context),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: getBorderRadiusFunc(20),
      ),
      child: DropdownButton<String>(
        value: _selectedValue,
        isExpanded: true,
        dropdownColor: primaryColor,
        underline: SizedBox.shrink(),
        items: <String>[
          'none',
          'course1',
          'course2',
          'course3',
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.sp),
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'sahel',
                  fontSize: 14.sp,
                ),
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue!;
          });
        },
      ),
    );
  }
}
