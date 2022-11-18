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
  Color backgorundColor;
  

  Item({
    @required this.name,
    @required this.imagePath,
    @required this.originalPrice,
    @required this.rating,
    @required this.description,
    @required this.height,
    @required this.weight,
    @required this.backgorundColor,
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
}
