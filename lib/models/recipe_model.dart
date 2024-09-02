class RecipeModel {
  final int id;
  final String title;
  final String imageUrl;
  final String summary;
  final int readyInMinutes;
  final int healthScore;
  final List<String> originalIngredients;

  RecipeModel({
    required this.id,
    required this.title,
    required this.imageUrl,
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
      id: json['id'],
      title: json['title'],
      imageUrl: json['image'],
      summary: json['summary'],
      readyInMinutes: json['readyInMinutes'],
      healthScore: json['healthScore'],
      originalIngredients: originalIngredients,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'summary': summary,
      'readyInMinutes': readyInMinutes,
      'healthScore': healthScore,
      'originalIngredients': originalIngredients.join(','),
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      summary: map['summary'],
      readyInMinutes: map['readyInMinutes'],
      healthScore: map['healthScore'],
      originalIngredients: (map['originalIngredients'] as String).split(','),
    );
  }
}
