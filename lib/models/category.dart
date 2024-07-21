// lib/models/category.dart
class Category {
  final int id;
  final String name;
  final String coverImage;

  Category({
    required this.id,
    required this.name,
    required this.coverImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      coverImage: json['cover_image'],
    );
  }
}
