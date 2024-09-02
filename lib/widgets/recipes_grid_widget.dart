import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/recipe_model.dart';
import '../services/database_helper.dart';
import '../services/recipe_service.dart';
import 'grid_item_widget.dart';

class RecipesGrid extends StatefulWidget {
  const RecipesGrid({super.key, required this.dishType});
  final String dishType;

  @override
  State<RecipesGrid> createState() => _RecipesGridState();
}

class _RecipesGridState extends State<RecipesGrid> {
  late Future<List<RecipeModel>> _recipesFuture;
  final RecipeService _recipeService = RecipeService(Dio());
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  @override
  void didUpdateWidget(covariant RecipesGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dishType != widget.dishType) {
      _fetchRecipes();
    }
  }

  void _fetchRecipes() {
    setState(() {
      _recipesFuture = _recipeService.fetchRecipes(
        cuisine: 'American',
        type: widget.dishType,
        number: 20,
      );
    });
  }

  void _toggleFavorite(RecipeModel recipe) async {
    final favorites = await _databaseHelper.getFavorites();
    final isFavorite = favorites.any((fav) => fav.id == recipe.id);

    if (isFavorite) {
      await _databaseHelper.deleteFavorite(recipe.id);
    } else {
      await _databaseHelper.insertFavorite(recipe);
    }

    setState(() {});
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
                  return FutureBuilder<List<RecipeModel>>(
                    future: _databaseHelper.getFavorites(),
                    builder: (context, snapshot) {
                      final isFavorite =
                          snapshot.data?.any((fav) => fav.id == recipe.id) ??
                              false;
                      return RecipeGridItem(
                        recipe: recipe,
                        isFavorite: isFavorite,
                        onFavoriteToggle: () => _toggleFavorite(recipe),
                      );
                    },
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
