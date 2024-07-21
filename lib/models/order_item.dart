import 'dart:convert';

import 'package:all_in_1/models/item.dart';

class OrderItem {
  final int id;
  final int order_id;
  final int item_id;
  final String name;
  final double price;
  final int quantity;

  OrderItem({
    required this.id,
    required this.order_id,
    required this.item_id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  // Convert CartItem to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'order_id': order_id,
        'item_id': item_id,
        'name': name,
        'price': price,
        'quantity': quantity,
      };

  // Create CartItem from JSON
  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json['id'] ?? "",
        order_id: json['order_id'] ?? 0,
        item_id: json['item_id'] ?? 0,
        name: json['name'] ?? "",
        price: (json['price'] as num?)?.toDouble() ?? 0,
        quantity: json['quantity'] ?? 0,
      );
}
