class HomeModel {
  HomeModel({
      this.page, 
      this.perPage, 
      this.totalItems, 
      this.totalPages, 
      this.items,});

  HomeModel.fromJson(dynamic json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }
  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<Items>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['perPage'] = perPage;
    map['totalItems'] = totalItems;
    map['totalPages'] = totalPages;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Items {
  Items({
      this.category, 
      this.checkCart, 
      this.collectionId, 
      this.collectionName, 
      this.courseImage, 
      this.courseName, 
      this.coursePrice, 
      this.created, 
      this.description, 
      this.id, 
      this.imageUrl, 
      this.updated,});

  Items.fromJson(dynamic json) {
    category = json['category'] != null ? json['category'].cast<String>() : [];
    checkCart = json['checkCart'];
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    courseImage = json['courseImage'];
    courseName = json['courseName'];
    coursePrice = json['coursePrice'];
    created = json['created'];
    description = json['description'];
    id = json['id'];
    imageUrl = json['imageUrl'];
    updated = json['updated'];
  }
  List<String>? category;
  bool? checkCart;
  String? collectionId;
  String? collectionName;
  String? courseImage;
  String? courseName;
  int? coursePrice;
  String? created;
  String? description;
  String? id;
  String? imageUrl;
  String? updated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category'] = category;
    map['checkCart'] = checkCart;
    map['collectionId'] = collectionId;
    map['collectionName'] = collectionName;
    map['courseImage'] = courseImage;
    map['courseName'] = courseName;
    map['coursePrice'] = coursePrice;
    map['created'] = created;
    map['description'] = description;
    map['id'] = id;
    map['imageUrl'] = imageUrl;
    map['updated'] = updated;
    return map;
  }

}