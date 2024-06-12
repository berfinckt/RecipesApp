class Meal {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final List<String> ingredients;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (var i = 1; i <= 20; i++) {
      if (json['strIngredient$i'] != null &&
          json['strIngredient$i'].isNotEmpty) {
        ingredients.add(json['strIngredient$i']);
      }
    }
    return Meal(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strCategory: json['strCategory'] ?? 'Unknown Category',
      strArea: json['strArea'] ?? 'Unknown Area',
      strInstructions: json['strInstructions'] ?? 'No instructions available.',
      strMealThumb: json['strMealThumb'] ?? 'https://via.placeholder.com/150',
      ingredients: ingredients,
    );
  }
}
