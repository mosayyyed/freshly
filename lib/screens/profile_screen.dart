import 'package:flutter/material.dart';

import '../widgets/profile/profile_header.dart';
import '../widgets/profile/profile_options.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileHeader(),
              SizedBox(height: 16),
              ProfileOptions(),
            ],
          ),
        ),
      ),
    );
  }
}
