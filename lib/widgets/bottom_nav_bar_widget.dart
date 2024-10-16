import 'package:flutter/cupertino.dart';

import '../constants.dart';

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
      height: MediaQuery.of(context).size.height * 0.08,
      iconSize: 26.0,
      currentIndex: selectedIndex,
      inactiveColor: CupertinoColors.label,
      activeColor: kPrimaryColor,
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
          icon: Icon(CupertinoIcons.play_rectangle),
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(CupertinoIcons.info),
        // ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
        ),
      ],
      onTap: onItemTapped,
    );
  }
}
