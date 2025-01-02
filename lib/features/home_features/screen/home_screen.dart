import 'dart:io';

import 'package:codeplus/const/responsive.dart';
import 'package:codeplus/const/shape/border_radius.dart';
import 'package:codeplus/const/shape/media_query.dart';
import 'package:codeplus/const/theme/colors.dart';
import 'package:codeplus/features/home_features/logic/home_bloc.dart';
import 'package:codeplus/features/home_features/model/home_model.dart';
import 'package:codeplus/features/home_features/services/home_api_repository.dart';
import 'package:codeplus/features/public_features/functions/category_selector/category_selector.dart';
import 'package:codeplus/features/public_features/widget/error_screen_widget.dart';
import 'package:codeplus/features/public_features/widget/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/aboutUs_widget.dart';
import '../widget/courses_features_widget.dart';
import '../widget/courses_info_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String screenId = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> callHomeBloc() async {
    BlocProvider.of<HomeBloc>(context).add(CallHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        HomeApiRepository(),
      )..add(
          CallHomeEvent(),
        ),
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: callHomeBloc,
          color: primaryColor,
          child: Scaffold(
            backgroundColor: primary2Color,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SearchBarWidget(),
                ),
                SliverList(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is HomeLoadingState) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is HomeCompletedState) {
                            return HomeContentWidget(
                              homeModel: state.homeModel,
                            );
                          }
                          if (state is HomeErrorState) {
                            return ErrorScreenWidget(
                              errorMsg: state.error.errorMsg!,
                              function: () {
                                BlocProvider.of<HomeBloc>(context)
                                    .add(CallHomeEvent());
                              },
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeContentWidget extends StatelessWidget {
  const HomeContentWidget({
    super.key,
    required this.homeModel,
  });

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoursesInfoWidget(
          homeModel: homeModel,
        ),
        AboutUsWidget(),
        CoursesFeaturesWidget(
          title: 'کوتاه و کاربردی',
          icon: Icons.access_time_filled_outlined,
        ),
        CoursesFeaturesWidget(
          title: 'پشتیبانی داعمی',
          icon: Icons.support_agent
        ),
        CoursesFeaturesWidget(
          title: 'آپدیت داعمی',
          icon: Icons.system_update_tv_sharp,
        ),
        CoursesFeaturesWidget(
          title: 'پروژه محور',
          icon: Icons.code,
        ),
      ],
    );
  }
}



