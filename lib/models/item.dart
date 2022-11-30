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
    this.name,
    this.imagePath,
    this.originalPrice,
    this.rating,
    this.description,
    this.height,
    this.weight,
    // this.backgorundColor,
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

  factory Item.fromJson(Map<String, dynamic> data, String id) {
    //print("aaaa $id");
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
  factory Item.test() {
    String name = "data['name']";
    String imagePath = "assets/images/furniture/items/chair3.png";
    int discountPercent = 0;
    double originalPrice = 0;
    double rating = 0;
    String description = "data['description']";
    int height = 32;
    int weight = 38;
    String color = "Colors.black";
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

class CategoriesFirebase {
  String id;
  String title;
  CategoriesFirebase({this.id, this.title});
}
