import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yemek_tarifleri/models/meal_model.dart';
import 'package:yemek_tarifleri/services/api_service.dart';
import 'package:yemek_tarifleri/providers/favorite_provider.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  MealDetailScreen({required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yemek Detayı'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService().fetchMealDetail(mealId),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error occurred'));
          } else if (snapshot.hasData) {
            var meal = Meal.fromJson(snapshot.data!);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(meal.strMealThumb),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(meal.strMeal,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Kategori: ${meal.strCategory}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Bölge: ${meal.strArea}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Malzemeler:'),
                  ),
                  for (var ingredient in meal.ingredients)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ingredient),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Talimatlar:'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(meal.strInstructions),
                  ),
                  Consumer<FavoriteProvider>(
                    builder: (ctx, favoriteProvider, _) {
                      final isFavorite = favoriteProvider.isFavorite(mealId);
                      return IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          if (isFavorite) {
                            favoriteProvider.removeMealFromFavorites(mealId);
                          } else {
                            favoriteProvider.addMealToFavorites(meal);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
