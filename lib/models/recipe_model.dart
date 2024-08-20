class RecipeModel {
  final String title;
  final String image;
  final String summary;
  final int readyInMinutes;
  final int healthScore;
  final List<String> originalIngredients;

  RecipeModel({
    required this.title,
    required this.image,
    required this.summary,
    required this.readyInMinutes,
    required this.healthScore,
    required this.originalIngredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    final originalIngredients = (json['extendedIngredients'] as List<dynamic>)
        .map((ingredient) => ingredient['original'] as String)
        .toList();

    return RecipeModel(
      title: json['title'],
      image: json['image'],
      summary: json['summary'],
      readyInMinutes: json['readyInMinutes'],
      healthScore: json['healthScore'],
      originalIngredients: originalIngredients,
    );
  }
}
