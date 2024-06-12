import 'package:flutter/material.dart';
import 'package:yemek_tarifleri/models/meal_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => _favoriteMeals;

  void addMealToFavorites(Meal meal) {
    _favoriteMeals.add(meal);
    notifyListeners();
  }

  void removeMealFromFavorites(String idMeal) {
    _favoriteMeals.removeWhere((meal) => meal.idMeal == idMeal);
    notifyListeners();
  }

  bool isFavorite(String idMeal) {
    return _favoriteMeals.any((meal) => meal.idMeal == idMeal);
  }
}
