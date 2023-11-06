class MyModel {
  final int id;
  bool isFavorite;

  MyModel({required this.id, this.isFavorite = false});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'isFavorite': isFavorite,
    };
  }

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      id: json['id'],
      isFavorite: json['isFavorite'],
    );
  }
}