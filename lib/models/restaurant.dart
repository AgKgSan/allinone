// lib/models/restaurant.dart
class Restaurant {
  final int id;
  final String name;
  final String shopType;
  final String address;
  final double latitude;
  final double longitude;
  final int rating;
  final int isPopular;
  final String description;
  final String logo;

  Restaurant({
    required this.id,
    required this.name,
    required this.shopType,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.isPopular,
    required this.description,
    required this.logo,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      shopType: json['shop_type'] ?? '',
      address: json['address'] ?? '',
      latitude: double.tryParse(json['latitude'] ?? '0') ?? 0,
      longitude: double.tryParse(json['longitude'] ?? '0') ?? 0,
      rating: json['rating'] ?? 0,
      isPopular: json['is_popular'] ?? 0,
      description: json['description'] ?? '',
      logo: json['logo'] ?? '',
    );
  }
}
