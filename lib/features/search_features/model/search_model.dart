class SearchModel {
  SearchModel({
      this.page, 
      this.perPage, 
      this.totalItems, 
      this.totalPages, 
      this.items,});

  SearchModel.fromJson(dynamic json) {
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



}

class Items {
  Items({
      this.category, 
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

}