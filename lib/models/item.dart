// lib/models/item.dart
import 'package:all_in_1/models/category.dart';
import 'package:all_in_1/models/restaurant.dart';

class Item {
  final int id;
  final String name;
  final String coverImage;
  final double price;
  final double rating;
  final double? offerPrice;
  final num isOfferItem;
  final Category category;
  final Restaurant restaurant;

  Item({
    required this.id,
    required this.name,
    required this.coverImage,
    required this.price,
    required this.rating,
    required this.offerPrice,
    required this.isOfferItem,
    required this.category,
    required this.restaurant,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      coverImage: json['cover_image'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      offerPrice: (json['offer_price'] as num?)?.toDouble() ?? 0,
      isOfferItem: json['is_offer_item'] ?? 0,
      category: Category.fromJson(json['category'] ?? {}),
      restaurant: Restaurant.fromJson(json['restaurant'] ?? {}),
    );
  }
}
