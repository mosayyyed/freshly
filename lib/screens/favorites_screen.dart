// lib/screens/favorites_screen.dart
import 'package:flutter/material.dart';

import '../models/recipe_model.dart';
import '../services/database_helper.dart';
import '../widgets/grid_item_widget.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  FavoritesScreenState createState() => FavoritesScreenState();
}

class FavoritesScreenState extends State<FavoritesScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  late Future<List<RecipeModel>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _favoritesFuture = _databaseHelper.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: FutureBuilder<List<RecipeModel>>(
              future: _favoritesFuture,
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
                    child: Center(child: Text('No favorites found')),
                  );
                } else {
                  final favorites = snapshot.data!;
                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      mainAxisExtent: 185.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final recipe = favorites[index];
                        return RecipeGridItem(
                          recipe: recipe,
                          isFavorite: true,
                          onFavoriteToggle: () async {
                            await _databaseHelper.deleteFavorite(recipe.id);
                            setState(() {
                              _favoritesFuture = _databaseHelper.getFavorites();
                            });
                          },
                        );
                      },
                      childCount: favorites.length,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
