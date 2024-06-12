import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse("${baseUrl}categories.php"));
    if (response.statusCode == 200) {
      return json.decode(response.body)['categories'];
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<dynamic>> fetchMealsByCategory(String category) async {
    final response =
        await http.get(Uri.parse("${baseUrl}filter.php?c=$category"));
    if (response.statusCode == 200) {
      return json.decode(response.body)['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<Map<String, dynamic>> fetchMealDetail(String mealId) async {
    final response =
        await http.get(Uri.parse("${baseUrl}lookup.php?i=$mealId"));
    if (response.statusCode == 200) {
      return (json.decode(response.body)['meals'][0]) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load meal details');
    }
  }
}
