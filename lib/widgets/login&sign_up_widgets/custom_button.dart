import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomBotton extends StatelessWidget {
  CustomBotton({super.key, required this.titel, this.onTap});
  String titel;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          titel,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
