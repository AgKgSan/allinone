// lib/services/category_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryService {
  final String apiUrl =
      'http://127.0.0.1:8000/api/categories'; // Replace with your API URL

  Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
