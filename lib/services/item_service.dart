// lib/services/category_service.dart
import 'dart:convert';
import 'package:all_in_1/models/item.dart';
import 'package:http/http.dart' as http;

class ItemService {
  final String apiUrl =
      'http://127.0.0.1:8000/api/items'; // Replace with your API URL

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<Item> fetchItemById(num id) async {
    final response = await http.get(Uri.parse("${apiUrl}/${id}"));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return Item.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load items');
    }
  }
}
