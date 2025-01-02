import 'dart:io';

import 'package:codeplus/features/auth_features/logic/bloc/auth_bloc.dart';
import 'package:codeplus/features/auth_features/services/auth_api_repository.dart';
import 'package:codeplus/features/home_features/logic/home_bloc.dart';
import 'package:codeplus/features/home_features/services/home_api_repository.dart';
import 'package:codeplus/features/intro_features/logic/intro_cubit.dart';
import 'package:codeplus/features/intro_features/screens/splash_screen.dart';
import 'package:codeplus/features/public_features/logic/bottomnav/bottomnav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth_features/screen/auth_screen.dart';
import 'features/auth_features/screen/auth_success_screen.dart';
import 'features/auth_features/screen/phone_auth_screen.dart';
import 'features/auth_features/screen/sign_up_screen.dart';
import 'features/home_features/screen/home_screen.dart';
import 'features/public_features/screen/bottom_nav_bar.dart';

void main() {
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
            BottomNavBarScreen.screenId: (context) => BottomNavBarScreen(),
            SignUpScreen.screenId: (context) => SignUpScreen(),
            AuthScreen.screenId: (context) => AuthScreen(),
            PhoneAuthScreen.screenId: (context) => PhoneAuthScreen(),
            AuthSuccessScreen.screenId: (context) => AuthSuccessScreen(),
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
