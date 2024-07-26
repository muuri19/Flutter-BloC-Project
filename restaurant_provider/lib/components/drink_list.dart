import 'package:flutter/material.dart';
import 'package:restaurant_provider/data/models/restaurant_detail.dart';

class DrinkList extends StatelessWidget {
  final RestaurantDetail restaurants;

  const DrinkList({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: restaurants.menus.drinks.length,
        itemBuilder: (context, index) {
          return _buildDrinkList(context, restaurants.menus.drinks[index]);
        },
      ),
    );
  }
}

Widget _buildDrinkList(BuildContext context, Category drink) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Chip(
      label: Text(drink.name),
    ),
  );
}
