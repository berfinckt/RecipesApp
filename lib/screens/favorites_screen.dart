import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yemek_tarifleri/providers/favorite_provider.dart';
import 'package:yemek_tarifleri/screens/meal_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favori Tarifler'),
      ),
      body: Consumer<FavoriteProvider>(
        builder: (ctx, favoriteProvider, _) {
          var favoriteMeals = favoriteProvider.favoriteMeals;
          if (favoriteMeals.isEmpty) {
            return Center(child: Text('Henüz favori tarif yok.'));
          } else {
            return ListView.builder(
              itemCount: favoriteMeals.length,
              itemBuilder: (ctx, index) {
                var meal = favoriteMeals[index];
                return ListTile(
                  leading: Image.network(meal.strMealThumb),
                  title: Text(meal.strMeal),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MealDetailScreen(mealId: meal.idMeal),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
