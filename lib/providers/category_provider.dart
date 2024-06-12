import 'package:flutter/material.dart';
import 'package:yemek_tarifleri/services/api_service.dart';
import 'package:yemek_tarifleri/models/category_model.dart';

class CategoryProvider with ChangeNotifier {
  ApiService _apiService = ApiService();
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      var categoryList = await _apiService.fetchCategories();
      _categories =
          categoryList.map((data) => Category.fromJson(data)).toList();
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
