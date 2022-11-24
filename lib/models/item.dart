import 'package:flutter/material.dart';

class Item {
  String name;
  String imagePath;
  int discountPercent;
  double originalPrice;
  double rating;
  String description;
  int height;
  int weight;
  final String color;
  //Color backgorundColor;

  Item({
    @required this.name,
    @required this.imagePath,
    @required this.originalPrice,
    @required this.rating,
    @required this.description,
    @required this.height,
    @required this.weight,
    //@required this.backgorundColor,
    @required this.color,
    this.discountPercent,
  });

  double get price {
    return discountPercent != null
        ? (originalPrice - (originalPrice * discountPercent / 100))
        : originalPrice;
  }

  static String format(double price) {
    String money = price.toStringAsFixed(2);
    return '\$$money';
  }

  factory Item.fromJson(Map<String, dynamic> data) {
    String name = data['name'];
    String imagePath = data['imagePath'];
    int discountPercent = data['discountPercent'];
    double originalPrice = data['originalPrice'];
    double rating = data['rating'];
    String description = data['description'];
    int height = data['height'];
    int weight = data['weight'];
    String color = data['color'];
    return Item(
      color: color,
      name: name,
      imagePath: imagePath,
      discountPercent: discountPercent,
      originalPrice: originalPrice,
      rating: rating,
      description: description,
      height: height,
      weight: weight,
    );
  }
}
