import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yemek_tarifleri/providers/category_provider.dart';
import 'package:yemek_tarifleri/providers/favorite_provider.dart';
import 'package:yemek_tarifleri/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => CategoryProvider()),
        ChangeNotifierProvider(create: (ctx) => FavoriteProvider()),
      ],
      child: MaterialApp(
        title: 'Yemek Tarifleri',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
