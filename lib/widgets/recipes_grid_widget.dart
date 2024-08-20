import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/recipe_model.dart';
import '../services/recipe_service.dart';
import 'grid_item_widget.dart';

class RecipesGrid extends StatefulWidget {
  const RecipesGrid({super.key});

  @override
  State<RecipesGrid> createState() => _RecipesGridState();
}

class _RecipesGridState extends State<RecipesGrid> {
  late Future<List<RecipeModel>> _recipesFuture;
  final RecipeService _recipeService = RecipeService(Dio());

  @override
  void initState() {
    super.initState();
    _recipesFuture = _recipeService.fetchRecipes(
      cuisine: 'Mediterranean',
      type: 'main course',
      number: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: FutureBuilder<List<RecipeModel>>(
        future: _recipesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasError) {
            return SliverFillRemaining(
              child: Center(child: Text('Error: ${snapshot.error}')),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const SliverFillRemaining(
              child: Center(child: Text('No recipes found')),
            );
          } else {
            final recipes = snapshot.data!;
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                mainAxisExtent: 185.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final recipe = recipes[index];
                  return RecipeGridItem(
                    recipe: recipe,
                    isFavorite: true,
                    onFavoriteToggle: () {},
                  );
                },
                childCount: recipes.length,
              ),
            );
          }
        },
      ),
    );
  }
}
