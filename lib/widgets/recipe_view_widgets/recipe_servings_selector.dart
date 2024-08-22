import 'package:flutter/material.dart';

class RecipeServingsSelector extends StatelessWidget {
  final int servings;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const RecipeServingsSelector({
    super.key,
    required this.servings,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$servings Serving${servings > 1 ? 's' : ''}',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              _buildServingsButton(Icons.remove, onDecrease),
              const SizedBox(width: 16.0),
              _buildServingsButton(Icons.add, onIncrease),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServingsButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF01937c)),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(icon, size: 18.0),
        ),
      ),
    );
  }
}
