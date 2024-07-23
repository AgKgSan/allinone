// lib/services/category_service.dart
import 'dart:convert';
import 'package:all_in_1/models/item.dart';
import 'package:http/http.dart' as http;

class ResService {
  final String apiUrl =
      'http://127.0.0.1:8000/api/restaurants'; // Replace with your API URL

  Future<List<dynamic>> fetchRess() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<dynamic>> fetchPopularItems() async {
    final response = await http.get(Uri.parse(apiUrl + "?is_offer_item=1"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<dynamic> fetchItemById(num id) async {
    final response = await http.get(Uri.parse("${apiUrl}/${id}"));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse;
    } else {
      throw Exception('Failed to load items');
    }
  }
}
