import 'dart:convert';
import 'package:all_in_1/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  // Replace with your API endpoint

  Future<List<Order>> getOrderHistory() async {
    String _baseUrl = 'http://127.0.0.1:8000/api/orders_history';

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('access_token');

    final url = Uri.parse(_baseUrl);
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
