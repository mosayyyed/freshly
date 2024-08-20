import 'package:dio/dio.dart';
import '../env/env.dart';
import '../models/recipe_model.dart';

class RecipeService {
  final Dio _dio;


  RecipeService(this._dio);

  Future<List<RecipeModel>> fetchRecipes({
    String cuisine = 'Mediterranean',
    String type = 'main course',
    int number = 10,
  }) async {
    try {
      final response = await _dio.get(
        Env.endPoint,
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
