import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.dehaze_rounded),
          Text('Freshly'),
          Icon(Icons.search),
        ],
      ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.green, size: 30.0),
      titleTextStyle: const TextStyle(
          color: Colors.green, fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(56.0); // AppBar's default height in Material
}
