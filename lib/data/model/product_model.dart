// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
  json.decode(str).map((x) => ProductModel.fromJson(x)),
);

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  final int? id;
  final String? name;
  final String? category;
  final int? price;
  final String? description;
  final int? stock;
  final double? rating;

  ProductModel({
    this.id,
    this.name,
    this.category,
    this.price,
    this.description,
    this.stock,
    this.rating,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? category,
    int? price,
    String? description,
    int? stock,
    double? rating,
  }) => ProductModel(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    price: price ?? this.price,
    description: description ?? this.description,
    stock: stock ?? this.stock,
    rating: rating ?? this.rating,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    category: json["category"],
    price: json["price"],
    description: json["description"],
    stock: json["stock"],
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category,
    "price": price,
    "description": description,
    "stock": stock,
    "rating": rating,
  };
}
