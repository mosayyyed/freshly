import 'package:dio/dio.dart';

import '../models/recipe_model.dart';

class RecipeService {
  final Dio _dio;

  static const _apiKey = '9adbee6141624fb4a0101d11f55111a9';
  static const _endPoint = 'https://api.spoonacular.com/recipes/complexSearch';

  RecipeService(this._dio);

  Future<List<RecipeModel>> fetchRecipes({
    String cuisine = 'Mediterranean',
    String type = 'main course',
    int number = 10,
  }) async {
    try {
      final response = await _dio.get(
        _endPoint,
        queryParameters: {
          'cuisine': cuisine,
          'type': type,
          'addRecipeInformation': 'true',
          'fillIngredients': 'true',
          'number': number,
          'apiKey': _apiKey,
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
