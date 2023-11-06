class ProductResponse {
  final int id;
  final String name;
  final String imageLink;
  final String price;
  final String description;
  final String rate;
  final Category category;

  ProductResponse({
    required this.id,
    required this.name,
    required this.imageLink,
    required this.price,
    required this.description,
    required this.rate,
    required this.category,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      imageLink: json['image_link'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      rate: json['rate'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    );
  }
}

class Category {
  final int id;
  final String name;
  final String imageLink;

  Category({
    required this.id,
    required this.name,
    required this.imageLink,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      imageLink: json['image_link'] as String,
    );
  }
}