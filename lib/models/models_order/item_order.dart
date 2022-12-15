import '../parse.dart';

class ItemOrder {
  String id;
  String name;
  double price;
  String color;
  int number;

  ItemOrder({this.id, this.name, this.color, this.price, this.number});

  factory ItemOrder.fromJson(Map<String, dynamic> data, String id) {
    //print("aaaa $id");
    String name = data['name'];
    String color = data['color'];
    int number = Parse.parseIntFromJson(data['number']);
    double price = Parse.parseDoubleFromJson(data['price']);
    return ItemOrder(
      id: id,
      name: name,
      color: color,
      price: price,
      number: number,
    );
  }
}
