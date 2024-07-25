import 'package:flutter/material.dart';
import 'package:restaurant_api_dicoding/widgets/custom_appbar.dart';

class Restaurant2ListPage extends StatefulWidget {
  static const routeName = '/model2';
  const Restaurant2ListPage({super.key});

  @override
  _Restaurant2ListPageState createState() => _Restaurant2ListPageState();
}

class _Restaurant2ListPageState extends State<Restaurant2ListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppbar(title: 'Model 2'));
  }
}
