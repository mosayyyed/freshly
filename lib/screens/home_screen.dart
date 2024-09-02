import 'package:flutter/material.dart';

import '../widgets/category_selector_widget.dart';
import '../widgets/featured_recipe_banner_widget.dart';
import '../widgets/recipes_grid_widget.dart';
import '../widgets/section_header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = [
    "All Recipes",
    "Break fast",
    "Lunch",
    "Dinner",
    "Snack",
  ];

  String _selectedCategory = 'All Recipes';

  void _onCategoryTapped(int index) {
    setState(() {
      _selectedCategory = _categories[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const FeaturedRecipeBanner(),
          CategorySelector(
            allTags: _categories,
            selectedTagBackgroundColor: const Color(0xFF01937c),
            selectedIndex: _categories.indexOf(_selectedCategory),
            onItemTapped: _onCategoryTapped,
          ),
          const SectionHeader(title: 'Popular Recipes', seeMore: 'See All'),
          RecipesGrid(dishType: _selectedCategory),
        ],
      ),
    );
  }
}
