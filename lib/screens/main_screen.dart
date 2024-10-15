import 'package:flutter/material.dart';

import '../widgets/app_bar_widgets/app_bar_widget.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'shorts_screen.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoritesScreen(),
    const ShortsScreen(),
    // const InfoView(),
    const ProfileView(),
  ];
  final List<String> _appBarTitles = [
    "Home",
    "Favorite Recipe",
    "Shorts",
    // "Information",
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
      key: _scaffoldKey,
      appBar: MyCupertinoAppBar(
        title: _appBarTitles[_selectedIndex],
        onDrawerPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey[50],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(color: Color(0xFF01937c)),
                child: const DrawerHeader(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://avatar.iran.liara.run/public/boy'),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Welcome, User!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: Color(0xFF01937c)),
                title: const Text('Home'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite, color: Color(0xFF01937c)),
                title: const Text('Favorite Recipe'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.shopping_cart, color: Color(0xFF01937c)),
                title: const Text('Cart'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info, color: Color(0xFF01937c)),
                title: const Text('Information'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Color(0xFF01937c)),
                title: const Text('Profile'),
                onTap: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings, color: Color(0xFF01937c)),
                title: const Text('Settings'),
                onTap: () {
                  // Add settings functionality here
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Color(0xFF01937c)),
                title: const Text('Logout'),
                onTap: () {
                  // Add logout functionality here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
