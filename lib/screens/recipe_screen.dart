import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:freshly/models/recipe_model.dart';

import '../widgets/app_bar/recipe_app_bar_view.dart';

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
      servings = (servings + delta).clamp(1, 100);
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
            _buildImage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  _buildInfoRow(),
                  _buildSummary(),
                  _buildServingsSelector(),
                  _buildIngredientsHeader(),
                  _buildIngredientsList(),
                  _buildStartCookingButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: 230.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.recipe.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.recipe.title,
      style: const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF01937c),
      ),
    );
  }

  Widget _buildInfoRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildInfoColumn(Icons.access_time_outlined,
              '${widget.recipe.readyInMinutes} mins'),
          _buildInfoColumn(null, '${widget.recipe.originalIngredients.length}',
              label: 'Ingredients'),
          _buildInfoColumn(null, '${widget.recipe.healthScore}',
              label: 'Health Score'),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(IconData? icon, String text, {String? label}) {
    return Column(
      children: [
        if (icon != null)
          Icon(icon, size: 20.0, color: const Color(0xFF01937c)),
        const SizedBox(height: 4.0),
        Text(
          text,
          style: const TextStyle(
            color: Color(0xFF01937c),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (label != null) const SizedBox(height: 4.0),
        if (label != null)
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }

  Widget _buildSummary() {
    return HtmlWidget(
      widget.recipe.summary,
    );
  }

  Widget _buildServingsSelector() {
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
              _buildServingsButton(Icons.remove, () => _changeServings(-1)),
              const SizedBox(width: 16.0),
              _buildServingsButton(Icons.add, () => _changeServings(1)),
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

  Widget _buildIngredientsHeader() {
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
            onTap: _toggleGroceryList,
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

  Widget _buildIngredientsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.recipe.originalIngredients.map((ingredient) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Icon(Icons.circle, color: Color(0xFF01937c), size: 10),
              const SizedBox(width: 12.0),
              Expanded(
                child: Text(
                  ingredient,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStartCookingButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: ElevatedButton(
        onPressed: _startCooking,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF01937c),
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(50.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: const Text('Start cooking now'),
      ),
    );
  }
}
