import 'package:flutter/material.dart';

import '../widgets/app_bar_widgets/app_bar_widget.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import 'card_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';
import 'info_screen.dart';
import 'profile_screen.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoritesScreen(),
    const CardView(),
    const InfoView(),
    const ProfileView(),
  ];
  final List<String> _appBarTitles = [
    "Home",
    "Favorite Recipe",
    "Cart",
    "Information",
    "Profile",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCupertinoAppBar(
        title: _appBarTitles[_selectedIndex],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
