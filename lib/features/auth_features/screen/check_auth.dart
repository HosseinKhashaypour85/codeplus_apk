import 'package:codeplus/features/auth_features/screen/auth_screen.dart';
import 'package:codeplus/features/profile_features/screen/profile_screen.dart';
import 'package:codeplus/features/public_features/logic/token_checker/token_check_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});
  static const String screenId = '/check_auth';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokenCheckCubit , TokenCheckState>(
      builder: (context, state) {
        if(state is TokenIsLogedState){
          return const ProfileScreen();
        } else{
          return const AuthScreen();
        }
      },
    );
  }
}
