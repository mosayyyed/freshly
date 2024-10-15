import 'package:flutter/material.dart';

import 'custome_list_tile.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? color;
  final void Function()? onTap;

  const ProfileOption({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: CustomListTile(
        onTap: onTap,
        editTitle: Text(
          title,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: color ?? Colors.black,
          ),
          maxLines: 1,
        ),
        leadingIcon: Icon(icon, color: color ?? Colors.black),
      ),
    );
  }
}
