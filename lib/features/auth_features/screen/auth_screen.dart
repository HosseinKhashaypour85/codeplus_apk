import 'package:animate_do/animate_do.dart';
import 'package:codeplus/features/public_features/widget/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../const/shape/border_radius.dart';
import '../../../const/shape/media_query.dart';
import '../../../const/theme/colors.dart';
import '../logic/bloc/auth_bloc.dart';
import '../services/auth_api_repository.dart';
import '../widget/auth_section_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const String screenId = '/auth';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void dispose() {
    numberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthApiRepository()),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            getSnackBarWidget(
              context,
              state.errorMessageClass.errorMsg!,
              Colors.red,
            );
          }
          if (state is AuthCompletedState) {
            getSnackBarWidget(context, 'عالی', Colors.green);
            print('object');
          }
        },
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }
          return Scaffold(
            backgroundColor: primary2Color,
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AuthScreenContent(),
                        AuthSectionWidget(
                          numberController: numberController,
                          formController: _key,
                          passwordController: passwordController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AuthScreenContent extends StatelessWidget {
  const AuthScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(context, 0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: getBorderRadiusFunc(100),
              child: FadeInUp(
                child: Image.asset(
                  'assets/images/logo.jpg',
                  width: getWidth(context, 0.4),
                ),
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              'www.codeplus.ir',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontFamily: 'sahel',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
