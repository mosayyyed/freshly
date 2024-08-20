import 'package:flutter/material.dart';

import '../widgets/category_selector_widget.dart';
import '../widgets/featured_recipe_banner_widget.dart';
import '../widgets/recipes_grid_widget.dart';
import '../widgets/section_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          FeaturedRecipeBanner(),
          CategorySelector(
            allTags: [
              "All Recipes",
              "Breakfast",
              "Lunch",
              "Dinner",
              "Snack",
            ],
            selectedTagBackgroundColor: Color(0xFF01937c),
          ),
          SectionHeader(title: 'Popular Recipes', seeMore: 'See All'),
          RecipesGrid(),
        ],
      ),
    );
  }
}
