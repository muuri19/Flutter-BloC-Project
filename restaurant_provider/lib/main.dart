import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_provider/data/models/restaurant.dart';
import 'package:restaurant_provider/provider/restaurant_seacrh_provider.dart';
import 'package:restaurant_provider/ui/home_page.dart';
import 'package:restaurant_provider/ui/restaurant_detail_page.dart';
import 'package:restaurant_provider/ui/restaurant_list_page.dart';
import 'package:restaurant_provider/ui/restaurant_search_page.dart';

import 'data/api/api_service.dart';
import 'provider/restaurant_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<RestaurantSearchProvider>(
          create: (_) => RestaurantSearchProvider(apiService: ApiService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'REST API RESTAURANT',
        theme: ThemeData.dark(),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          RestaurantListPage.routeName: (context) => const RestaurantListPage(),
          RestaurantSearchPage.routeName: (context) =>
              const RestaurantSearchPage(),
          RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(

                    restaurant: ModalRoute.of(context)!.settings.arguments as Restaurant,
              ),
        },
      ),
    );
  }
}
