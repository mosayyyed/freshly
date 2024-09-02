import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/recipe_model.dart';
import '../screens/recipe_screen.dart';
import '../services/recipe_service.dart';

class FeaturedRecipeBanner extends StatefulWidget {
  const FeaturedRecipeBanner({super.key});

  @override
  FeaturedRecipeBannerState createState() => FeaturedRecipeBannerState();
}

class FeaturedRecipeBannerState extends State<FeaturedRecipeBanner> {
  final PageController _pageController = PageController();
  final RecipeService _recipeService = RecipeService(Dio());
  late Future<List<RecipeModel>> _recipesFuture;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _recipesFuture = _fetchRecipes();
    _startAutoScroll();
  }

  Future<List<RecipeModel>> _fetchRecipes() async {
    return await _recipeService.fetchRecipes(
      cuisine: '',
      type: 'dessert',
      number: 5,
    );
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage % 5,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecipeModel>>(
      future: _recipesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SliverToBoxAdapter(
            child: SizedBox(
                height: 200, child: Center(child: Text('No recipes found'))),
          );
        } else {
          final recipes = snapshot.data!;
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RecipeView(recipe: recipe),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF021C17),
                            image: DecorationImage(
                              image: NetworkImage(recipe.imageUrl),
                              fit: BoxFit.cover,
                              opacity: 0.5,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text(
                                  'FEATURED RECIPE',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        recipe.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white70,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          color: Colors.white70,
                                          size: 18,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${recipe.readyInMinutes} mins',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: recipes.length,
                      effect: const WormEffect(
                        dotColor: Colors.white70,
                        activeDotColor: Color(0xFF00967A),
                        dotHeight: 12,
                        dotWidth: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
