import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_api_dicoding/bloc/thema/thema_state.dart';
import 'package:restaurant_api_dicoding/bloc/thema/theme_bloc.dart';
import 'package:restaurant_api_dicoding/common/app_theme.dart';
import 'package:restaurant_api_dicoding/pages/restaurant2_list_page.dart';

import 'package:restaurant_api_dicoding/pages/restaurant_list_page.dart';
import 'package:restaurant_api_dicoding/pages/setting_page.dart';
import 'package:restaurant_api_dicoding/widgets/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Restaurant App List',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            initialRoute: BottomNavbarPage.routeName,
            routes: {
              //BOTTOM NAVIGATION BAR
              BottomNavbarPage.routeName: (context) => const BottomNavbarPage(),

              //RESTAURANT MODEL 1 (BLOC STATE MANAGEMENT)
              RestaurantListPage.routeName: (context) =>
                  const RestaurantListPage(),


              //RESTAURANT MODEL 2 (PROVIDER STATE MANAGEMENT)
              Restaurant2ListPage.routeName: (context) =>
                  const Restaurant2ListPage(),

              //SETTINGS
              SettingPage.routeName: (context) => SettingPage(),
            },
          );
        },
      ),
    );
  }
}
