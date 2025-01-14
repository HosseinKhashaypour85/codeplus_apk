import 'package:codeplus/features/auth_features/screen/auth_screen.dart';
import 'package:codeplus/features/auth_features/screen/check_auth.dart';
import 'package:codeplus/features/cart_features/screen/cart_screen.dart';
import 'package:codeplus/features/home_features/screen/home_screen.dart';
import 'package:codeplus/features/public_features/logic/bottomnav/bottomnav_cubit.dart';
import 'package:codeplus/features/public_features/logic/token_checker/token_check_cubit.dart';
import 'package:codeplus/features/search_features/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../const/theme/colors.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  static const String screenId = '/bottomnav';

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget>screenList = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    CheckAuthScreen(),
  ];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TokenCheckCubit>(context).tokenChecker();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavCubit, int>(
      builder: (context, state) {
        final bottomNavCubit = BlocProvider.of<BottomnavCubit>(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'sahel',
            ),
            unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'sahel',
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'صفحه اصلی',
                activeIcon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_outlined,
                ),
                label: 'جستجو',
                activeIcon:  Icon(
                  Icons.search,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: 'سبد خرید',
                activeIcon: Icon(
                  Icons.shopping_cart,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'پروفایل',
                activeIcon: Icon(
                  Icons.person,
                ),
              ),
            ],
            currentIndex: bottomNavCubit.currentIndex,
            onTap: (value) {
              BlocProvider.of<BottomnavCubit>(context).changeIndex(value);
            },
          ),
          body: screenList
              .elementAt(BlocProvider.of<BottomnavCubit>(context).currentIndex),
        );
      },
    );
  }
}