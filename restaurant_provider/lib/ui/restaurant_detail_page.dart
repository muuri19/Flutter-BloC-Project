import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_provider/data/api/api_service.dart';
import 'package:restaurant_provider/data/models/restaurant.dart';
import 'package:restaurant_provider/provider/restaurant_detail_provider.dart';
import 'package:restaurant_provider/widgets/detail_restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/detail-restaurant';

  final Restaurant restaurant;
  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (_) => RestaurantDetailProvider(
          apiService: ApiService(), restaurantId: restaurant.id),
      child: DetailRestaurant(restaurant: restaurant),
    );
  }
}
