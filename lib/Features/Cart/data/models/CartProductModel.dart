class CartProduct {
  String image;
  String title;
  String price;
  int count;

  CartProduct({required this.image, required this.title, required this.price, this.count = 1});

  // Create a method to convert Product to a Map for SharedPreferences
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'title': title,
      'price': price,
      'count': count,
    };
  }

  // Create a method to create a Product from a Map
  factory CartProduct.fromMap(Map<String, dynamic> map) {
    return CartProduct(
      image: map['image'],
      title: map['title'],
      price: map['price'],
      count: map['count'],
    );
  }
}