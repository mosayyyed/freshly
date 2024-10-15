import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/onboarding_screen.dart';
import 'expansion_tile.dart';
import 'profile_option.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOption(
          onTap: () {},
          title: 'Personal Info',
          icon: CupertinoIcons.person,
        ),
        ProfileOption(
          title: 'Favorites',
          icon: CupertinoIcons.heart,
          onTap: () {},
        ),
        const ProfileOption(
          title: 'Help & Support',
          icon: CupertinoIcons.question_circle,
        ),
        const SizedBox(height: 8),
        const ExpansionTileEdit(),
        const SizedBox(height: 8),
        ProfileOption(
          title: 'Log out',
          icon: CupertinoIcons.square_arrow_left,
          color: const Color(0xffE5736C),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}
