// To parse this JSON data, do
//
//     final storeProductsModel = storeProductsModelFromJson(jsonString);

import 'dart:convert';

List<StoreProductsModel> storeProductsModelFromJson(String str) =>
    List<StoreProductsModel>.from(
        json.decode(str).map((x) => StoreProductsModel.fromJson(x)));

String storeProductsModelToJson(List<StoreProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreProductsModel {
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;

  StoreProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.images,
  });

  factory StoreProductsModel.fromJson(Map<String, dynamic> json) =>
      StoreProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
