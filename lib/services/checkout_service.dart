import 'dart:convert';
import 'package:all_in_1/models/checkout_modal.dart';
import 'package:all_in_1/services/local_cart_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutService {
  // Replace with your API endpoint

  Future<void> submitOrder(dynamic order) async {
    String _baseUrl = 'http://127.0.0.1:8000/api/checkout';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LocalCartService localCartService = LocalCartService();
    print("----print");
    print(order);
    String? token = prefs.getString('access_token');

    final url = Uri.parse(_baseUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(order),
    );

    if (response.statusCode == 201) {
      // Order submitted successfully
      localCartService.clearCart();
      print('Order submitted successfully');
    } else {
      // Handle error
      print('Failed to submit order from: ${response.body}');
      throw Exception('Failed to submit order');
    }
  }
}
