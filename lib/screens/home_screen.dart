import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yemek_tarifleri/providers/category_provider.dart';
import 'package:yemek_tarifleri/screens/category_meals_screen.dart';
import 'package:yemek_tarifleri/screens/favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yemek Tarifleri'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<CategoryProvider>(context, listen: false)
            .fetchCategories(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error occurred'));
          } else {
            return Consumer<CategoryProvider>(
              builder: (ctx, categoryProvider, _) => ListView.builder(
                itemCount: categoryProvider.categories.length,
                itemBuilder: (ctx, index) {
                  final category = categoryProvider.categories[index];
                  return ListTile(
                    leading: Image.network(category.strCategoryThumb),
                    title: Text(category.strCategory),
                    subtitle: Text(category.strCategoryDescription),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => CategoryMealsScreen(
                              category: category.strCategory),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
