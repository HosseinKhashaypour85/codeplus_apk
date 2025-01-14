import 'dart:io';

import 'package:codeplus/features/auth_features/logic/bloc/auth_bloc.dart';
import 'package:codeplus/features/auth_features/logic/pref/save_phone_number.dart';
import 'package:codeplus/features/auth_features/services/auth_api_repository.dart';
import 'package:codeplus/features/cart_features/logic/cart_bloc.dart';
import 'package:codeplus/features/cart_features/services/cart_api_repository.dart';
import 'package:codeplus/features/home_features/logic/home_bloc.dart';
import 'package:codeplus/features/home_features/services/home_api_repository.dart';
import 'package:codeplus/features/intro_features/logic/intro_cubit.dart';
import 'package:codeplus/features/intro_features/screens/splash_screen.dart';
import 'package:codeplus/features/public_features/logic/bottomnav/bottomnav_cubit.dart';
import 'package:codeplus/features/public_features/logic/token_checker/token_check_cubit.dart';
import 'package:codeplus/features/search_features/logic/search_bloc.dart';
import 'package:codeplus/features/search_features/services/search_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hive/hive.dart';
import 'features/auth_features/screen/auth_screen.dart';
import 'features/auth_features/screen/auth_success_screen.dart';
import 'features/auth_features/screen/check_auth.dart';
import 'features/auth_features/screen/phone_auth_screen.dart';
import 'features/auth_features/screen/sign_up_screen.dart';
import 'features/cart_features/screen/cart_screen.dart';
import 'features/cart_features/screen/payment_webview.dart';
import 'features/courses_widget/screen/courses_info_screen.dart';
import 'features/home_features/screen/home_screen.dart';
import 'features/public_features/screen/bottom_nav_bar.dart';
import 'features/search_features/screen/search_screen.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => IntroCubit(),
          ),
          BlocProvider(
            create: (context) => BottomnavCubit(),
          ),
          BlocProvider(
            create: (context) => HomeBloc(
              HomeApiRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              AuthApiRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => TokenCheckCubit(),
          ),
          BlocProvider(
            create: (context) => SearchBloc(
              SearchApiRepository(),
            ),
          ),
          BlocProvider(
            create: (context) => CartBloc(
              CartApiRepository(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('fa'),
          ],
          initialRoute: SplashScreen.screenId,
          routes: {
            SplashScreen.screenId: (context) => SplashScreen(),
            HomeScreen.screenId: (context) => HomeScreen(),
            CoursesInfoScreen.screenId: (context) => CoursesInfoScreen(),
            BottomNavBarScreen.screenId: (context) => BottomNavBarScreen(),
            SignUpScreen.screenId: (context) => SignUpScreen(),
            AuthScreen.screenId: (context) => AuthScreen(),
            PhoneAuthScreen.screenId: (context) => PhoneAuthScreen(),
            AuthSuccessScreen.screenId: (context) => AuthSuccessScreen(),
            CheckAuthScreen.screenId: (context) => AuthSuccessScreen(),
            SearchScreen.screenId: (context) => SearchScreen(),
            CartScreen.screenId: (context) => CartScreen(),
            PaymentSWebViewScreen.screenId: (context) => PaymentSWebViewScreen(),
          },
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
