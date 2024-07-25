import 'package:flutter/material.dart';
import 'package:restaurant_api_dicoding/pages/restaurant2_list_page.dart';
import 'package:restaurant_api_dicoding/pages/restaurant_list_page.dart';
import 'package:restaurant_api_dicoding/pages/setting_page.dart';

class BottomNavbarPage extends StatefulWidget {
  static const routeName = 'bottomNavigationbar';

  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int _bottomNavIndex = 0;

  final List<Widget> _listWidget = [
    const RestaurantListPage(),
    const Restaurant2ListPage(),
    const SettingPage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.api_rounded),
      label: 'Model 1',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.api_rounded),
      label: 'Model 2',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings_rounded),
      label: 'Setting',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
