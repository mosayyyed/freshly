import 'package:flutter/material.dart';

class RecipeImageView extends StatelessWidget {
  final String imageUrl;

  const RecipeImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
