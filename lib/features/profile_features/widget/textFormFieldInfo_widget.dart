import 'package:codeplus/const/shape/border_radius.dart';
import 'package:codeplus/const/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFormFieldInfoWidget extends StatefulWidget {
  const TextFormFieldInfoWidget({super.key});

  @override
  State<TextFormFieldInfoWidget> createState() =>
      _TextFormFieldInfoWidgetState();
}

class _TextFormFieldInfoWidgetState extends State<TextFormFieldInfoWidget> {
  String? phoneNumber;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadNumber();
    _focusNode.requestFocus();
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        focusNode: _focusNode,
        readOnly: true,
        initialValue: phoneNumber,
        decoration: InputDecoration(
          filled: true,
          fillColor: primaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: getBorderRadiusFunc(20),
          ),
          label: Text(
            'شماره همراه شما',
            style: TextStyle(
              fontFamily: 'sahel',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          hintText: phoneNumber,
          hintStyle: TextStyle(
            fontFamily: 'vazir',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }
}
