class CategoriesResponse {
  int? count;
  dynamic? next;
  dynamic? previous;
  List<Results>? results;

  CategoriesResponse({this.count, this.next, this.previous, this.results});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
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

  Results({this.id, this.name, this.imageLink});

  Results.fromJson(Map<String, dynamic> json) {
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