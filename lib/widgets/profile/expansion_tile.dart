import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionTileEdit extends StatelessWidget {
  const ExpansionTileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.only(left: 30),
          iconColor: Colors.black,
          collapsedIconColor: Colors.black,
          leading: const Icon(
            CupertinoIcons.settings,
            size: 22,
            color: Colors.black,
          ),
          title: const Text(
            'Setting',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              leading: const Icon(
                CupertinoIcons.shield,
                size: 20,
              ),
              title: const Text(
                'Privacy',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              leading: const Icon(
                CupertinoIcons.info,
                size: 20,
              ),
              title: const Text(
                'Information',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
