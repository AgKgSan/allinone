import 'dart:convert';
import 'package:all_in_1/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  // Replace with your API endpoint

  Future<List<dynamic>> getOrderHistory() async {
    String _baseUrl = 'http://127.0.0.1:8000/api/orders-history';

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

    print("----print");
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
