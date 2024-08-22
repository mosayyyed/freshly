import 'package:flutter/material.dart';

class RecipeIngredientsList extends StatelessWidget {
  final List<String> ingredients;

  const RecipeIngredientsList({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ingredients.map((ingredient) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Icon(Icons.circle, color: Color(0xFF01937c), size: 10),
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  ingredient,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
