import 'package:sfuverce_app/models/parse.dart';
import 'package:sfuverce_app/screens/cart/option_modal_addCart.dart';

class Item {
  String categoryId;
  String productId;
  String name;
  String imagePath;
  int discountPercent;
  double originalPrice;
  double rating;
  String description;
  int height;
  int weight;
  final String color;

  Item({
    this.categoryId,
    this.productId,
    this.name,
    this.imagePath,
    this.originalPrice,
    this.rating,
    this.description,
    this.height,
    this.weight,
    this.color,
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

  factory Item.fromJson(
      Map<String, dynamic> data, String id, String categoryid) {
    //print("aaaa $id");
    String categoryId = categoryid;
    String productId = id;
    String name = data['name'];
    String imagePath = data['imagePath'];
    int discountPercent = Parse.parseIntFromJson(data['discountPercent']);
    double originalPrice = Parse.parseDoubleFromJson(data['originalPrice']);
    double rating = Parse.parseDoubleFromJson(data['rating']);
    String description = data['description'];
    int height = Parse.parseIntFromJson(data['height']);
    int weight = Parse.parseIntFromJson(data['weight']);
    String color = data['color'];
    return Item(
      categoryId: categoryId,
      productId: id,
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
  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'productId': productId,
      'color': color,
      'name': name,
      'imagePath': imagePath,
      'discountPercent': discountPercent,
      'originalPrice': originalPrice,
      'rating': rating,
      'description': description,
      'height': height,
      'weight': weight,
      'number': DataAddToCart.number,
    };
  }
}

class CategoriesFirebase {
  String id;
  String title;
  CategoriesFirebase({this.id, this.title});
}
