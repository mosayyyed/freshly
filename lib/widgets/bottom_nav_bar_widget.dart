import 'package:flutter/cupertino.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      backgroundColor: CupertinoColors.systemBackground,
      height: 70.0,
      iconSize: 26.0,
      currentIndex: selectedIndex,
      inactiveColor: CupertinoColors.label,
      activeColor: CupertinoColors.systemGreen,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.house,
            weight: 100,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cart),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.info),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
        ),
      ],
      onTap: onItemTapped,
    );
  }
}
