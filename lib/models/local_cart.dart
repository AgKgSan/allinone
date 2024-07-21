import 'dart:convert';

class LocalCartItem {
  final int id;
  final int item_id;
  final String name;
  final double price;
  final int quantity;

  LocalCartItem({
    required this.id,
    required this.item_id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  // Convert CartItem to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'item_id': item_id,
        'name': name,
        'price': price,
        'quantity': quantity,
      };

  // Create CartItem from JSON
  factory LocalCartItem.fromJson(Map<String, dynamic> json) => LocalCartItem(
        id: json['id'] ?? 0,
        item_id: json['item_id'] ?? 0,
        name: json['name'] ?? "",
        price: (json['price'] as num?)?.toDouble() ?? 0,
        quantity: json['quantity'] ?? 0,
      );
}
