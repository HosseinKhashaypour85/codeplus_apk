
import 'package:shared_preferences/shared_preferences.dart';

Future<void>savePhoneNumber(String phoneNumber)async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('phone_number', phoneNumber);
}

Future<String?>getPhoneNumber()async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('phone_number');
}