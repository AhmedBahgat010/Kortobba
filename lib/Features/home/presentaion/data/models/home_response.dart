class Product {
  final int? id;
  final String name;
  final String price;
  final String image;

  Product({required this.id, required this.name, required this.price, required this.image});
}

class HomeResponse {
  int? count;
  dynamic next;
  dynamic previous;
  List<Results>? results;

  HomeResponse({this.count, this.next, this.previous, this.results});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? name;
  String? imageLink;
  String? price;
  String? description;
  String? rate;
  Category? category;

  Results(
      {this.id,
      this.name,
      this.imageLink,
      this.price,
      this.description,
      this.rate,
      this.category});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
    price = json['price'];
    description = json['description'];
    rate = json['rate'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_link'] = this.imageLink;
    data['price'] = this.price;
    data['description'] = this.description;
    data['rate'] = this.rate;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? imageLink;

  Category({this.id, this.name, this.imageLink});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_link'] = this.imageLink;
    return data;
  }
}
