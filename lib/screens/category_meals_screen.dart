import 'package:flutter/material.dart';
import 'package:yemek_tarifleri/services/api_service.dart';
import 'package:yemek_tarifleri/screens/meal_detail_screen.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String category;

  CategoryMealsScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Tarifleri'),
      ),
      body: FutureBuilder(
        future: ApiService().fetchMealsByCategory(category),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error occurred'));
          } else {
            var meals = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) {
                var meal = meals[index];
                return ListTile(
                  leading: Image.network(meal['strMealThumb']),
                  title: Text(meal['strMeal']),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) =>
                            MealDetailScreen(mealId: meal['idMeal']),
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
