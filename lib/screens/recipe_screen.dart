import 'package:flutter/material.dart';

import '../models/recipe_model.dart';
import '../widgets/app_bar_widgets/recipe_app_bar_view.dart';
import '../widgets/recipe_view_widgets/recipe_image_view.dart';
import '../widgets/recipe_view_widgets/recipe_info_row.dart';
import '../widgets/recipe_view_widgets/recipe_ingredients_header.dart';
import '../widgets/recipe_view_widgets/recipe_ingredients_list.dart';
import '../widgets/recipe_view_widgets/recipe_servings_selector.dart';
import '../widgets/recipe_view_widgets/recipe_start_cooking_button.dart';
import '../widgets/recipe_view_widgets/recipe_summary_view.dart';
import '../widgets/recipe_view_widgets/recipe_title_view.dart';

class RecipeView extends StatefulWidget {
  final RecipeModel recipe;

  const RecipeView({super.key, required this.recipe});

  @override
  RecipeViewState createState() => RecipeViewState();
}

class RecipeViewState extends State<RecipeView> {
  int servings = 1;
  bool isAddedToGroceryList = false;

  void _changeServings(int delta) {
    setState(() {
      servings = (servings + delta).clamp(1, 10);
    });
  }

  void _toggleGroceryList() {
    setState(() {
      isAddedToGroceryList = !isAddedToGroceryList;
    });

    final message = isAddedToGroceryList
        ? 'Added to Grocery List'
        : 'Removed from Grocery List';

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _startCooking() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Let\'s start cooking!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCupertinoRecipeAppBarView(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeImageView(imageUrl: widget.recipe.image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeTitleView(title: widget.recipe.title),
                  RecipeInfoRow(
                    readyInMinutes: widget.recipe.readyInMinutes,
                    ingredientsCount: widget.recipe.originalIngredients.length,
                    healthScore: widget.recipe.healthScore,
                  ),
                  RecipeSummaryView(summary: widget.recipe.summary),
                  RecipeServingsSelector(
                    servings: servings,
                    onIncrease: () => _changeServings(1),
                    onDecrease: () => _changeServings(-1),
                  ),
                  RecipeIngredientsHeader(
                    isAddedToGroceryList: isAddedToGroceryList,
                    onToggleGroceryList: _toggleGroceryList,
                  ),
                  RecipeIngredientsList(
                      ingredients: widget.recipe.originalIngredients),
                  RecipeStartCookingButton(onPressed: _startCooking),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
