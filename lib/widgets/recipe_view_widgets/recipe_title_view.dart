import 'package:flutter/material.dart';

class RecipeTitleView extends StatelessWidget {
  final String title;

  const RecipeTitleView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF01937c),
      ),
    );
  }
}
