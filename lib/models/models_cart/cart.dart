import 'package:sfuverce_app/models/models_cart/chair.dart';
import 'package:sfuverce_app/models/item.dart';

class Cart {
  final Chair chair;
  final Item item;
  final int quantity;

  Cart({
    this.item,
    this.chair,
    this.quantity,
  });
}
