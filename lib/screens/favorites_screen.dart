import 'package:flutter/material.dart';

import '../widgets/recipes_grid_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          RecipesGrid(),
        ],
      ),
    );
  }
}
