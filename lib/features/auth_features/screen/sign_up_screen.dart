import 'package:animate_do/animate_do.dart';
import 'package:codeplus/const/shape/border_radius.dart';
import 'package:codeplus/const/theme/colors.dart';
import 'package:codeplus/features/auth_features/logic/bloc/auth_bloc.dart';
import 'package:codeplus/features/auth_features/screen/phone_auth_screen.dart';
import 'package:codeplus/features/auth_features/services/auth_api_repository.dart';
import 'package:codeplus/features/auth_features/widget/password_field_widget.dart';
import 'package:codeplus/features/public_features/functions/secure_storage/secure_storage.dart';
import 'package:codeplus/features/public_features/screen/bottom_nav_bar.dart';
import 'package:codeplus/features/public_features/widget/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/responsive.dart';
import '../../../const/shape/media_query.dart';
import '../widget/textformfield_widget.dart';
import 'auth_success_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String screenId = '/sign_up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController phoneEditingController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isShowUse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary2Color,
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 200.sp,
              color: primaryColor,
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(AuthApiRepository()),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthCompletedState) {
                  SecureStorageClass().saveUserToken(state.token);
                  getSnackBarWidget(
                    context,
                    'شماره موبایل تایید شد',
                    Colors.green,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    PhoneAuthScreen.screenId,
                    (route) => false,
                    arguments: phoneEditingController.text,
                  );
                } else if (state is AuthErrorState) {
                  getSnackBarWidget(
                    context,
                    state.errorMessageClass.errorMsg ?? 'خطا در احراز هویت',
                    Colors.red,
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }
                return Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      spacing: 5.sp,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        ClipRRect(
                          borderRadius: getBorderRadiusFunc(100),
                          child: FadeInUp(
                            child: Image.asset(
                              'assets/images/logo.jpg',
                              width: getWidth(context, 0.38),
                            ),
                          ),
                        ),
                        Text(
                          'برای احراز هویت شماره خود را وارد کنید',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sahel',
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: Column(
                            spacing: 5.sp,
                            children: [
                              TextFormFieldMobileWidget(
                                labelText: 'شماره موبایل',
                                icon:
                                    const Icon(Icons.mobile_friendly_outlined),
                                textInputAction: TextInputAction.done,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                controller: phoneEditingController,
                                suffixIcon: null,
                              ),
                              PasswordFieldWidget(
                                labelText: 'رمز عبور',
                                icon: const Icon(Icons.password),
                                textInputAction: TextInputAction.done,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                controller: passwordController,
                                suffixIcon: null,
                              ),
                              PasswordFieldWidget(
                                labelText: 'تکرار رمز عبور',
                                icon: const Icon(Icons.password),
                                textInputAction: TextInputAction.done,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                controller: confirmPasswordController,
                                suffixIcon: null,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: isShowUse,
                                    onChanged: (value) {
                                      setState(() {
                                        isShowUse = !isShowUse;
                                      });
                                    },
                                    activeColor: primaryColor,
                                  ),
                                  Text(
                                    'قوانین و شرایط کد پلاس را میپذریم',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'sahel',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              fixedSize: Size(
                                getWidth(context, 3.29),
                                getHeight(context, 0.057),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: getBorderRadiusFunc(5),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate() &&
                                  isShowUse) {
                                BlocProvider.of<AuthBloc>(context).add(
                                  CallAuthEvent(
                                    phoneEditingController.text,
                                    passwordController.text,
                                    confirmPasswordController.text,
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'احراز هویت',
                              style: TextStyle(
                                fontFamily: 'sahel',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    phoneEditingController.dispose();
    super.dispose();
  }
}
