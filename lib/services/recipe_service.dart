import 'package:dio/dio.dart';
import 'package:freshly/env/env.dart';

import '../models/recipe_model.dart';

class RecipeService {
  final Dio _dio;

  RecipeService(this._dio);
  final endPoint = "https://api.spoonacular.com/recipes/complexSearch";
  Future<List<RecipeModel>> fetchRecipes({
    String cuisine = 'American',
    String type = 'main course',
    int number = 10,
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: {
          'cuisine': cuisine,
          'type': type,
          'addRecipeInformation': 'true',
          'fillIngredients': 'true',
          'number': number,
          'apiKey': Env.apiKey,
        },
      );

      return _processResponse(response);
    } catch (e) {
      return [];
    }
  }

  List<RecipeModel> _processResponse(Response response) {
    final List data = response.data['results'];
    return data.map((json) => RecipeModel.fromJson(json)).toList();
  }
}
