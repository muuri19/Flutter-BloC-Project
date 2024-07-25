import 'package:flutter/material.dart';

class DetailRestaurant extends StatefulWidget {
  static const routeName = '/detail-restaurant';
  const DetailRestaurant({super.key});

  @override
  _DetailRestaurantState createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
