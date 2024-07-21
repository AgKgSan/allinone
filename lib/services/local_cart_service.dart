import 'dart:convert';
import 'package:all_in_1/models/item.dart';
import 'package:all_in_1/models/local_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCartService {
  static const String _cartKey = 'cart_items';

  Future<void> addToCart(Item item, int quantity) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartItemsJson = prefs.getStringList(_cartKey);
    List<LocalCartItem> cartItems = cartItemsJson != null
        ? cartItemsJson
            .map((json) => LocalCartItem.fromJson(jsonDecode(json)))
            .toList()
        : [];

    final existingItemIndex = cartItems.indexWhere((i) => i.id == item.id);
    if (existingItemIndex != -1) {
      // Update quantity if item already exists in cart
      cartItems[existingItemIndex] = LocalCartItem(
        id: item.id,
        item_id: item.id,
        name: item.name,
        price: item.price,
        quantity: cartItems[existingItemIndex].quantity + quantity,
      );
    } else {
      cartItems.add(LocalCartItem(
        id: item.id,
        item_id: item.id,
        name: item.name,
        price: item.price,
        quantity: quantity,
      ));
    }

    // Save updated cart to local storage
    final updatedCartItemsJson =
        cartItems.map((i) => jsonEncode(i.toJson())).toList();
    await prefs.setStringList(_cartKey, updatedCartItemsJson);
  }

  Future<List<LocalCartItem>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartItemsJson = prefs.getStringList(_cartKey);
    return cartItemsJson != null
        ? cartItemsJson
            .map((json) => LocalCartItem.fromJson(jsonDecode(json)))
            .toList()
        : [];
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_cartKey, []);
  }
}
