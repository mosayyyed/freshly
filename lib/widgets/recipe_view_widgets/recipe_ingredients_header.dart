import 'package:flutter/material.dart';

class RecipeIngredientsHeader extends StatelessWidget {
  final bool isAddedToGroceryList;
  final VoidCallback onToggleGroceryList;

  const RecipeIngredientsHeader({
    super.key,
    required this.isAddedToGroceryList,
    required this.onToggleGroceryList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Ingredients",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: onToggleGroceryList,
            child: Container(
              decoration: BoxDecoration(
                color: isAddedToGroceryList
                    ? const Color(0xFF01937c)
                    : Colors.transparent,
                border: Border.all(color: const Color(0xFF01937c)),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  isAddedToGroceryList ? 'Added' : 'Add to Grocery List',
                  style: TextStyle(
                    color: isAddedToGroceryList ? Colors.white : Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
