import 'package:sfuverce_app/models/models_cart/chair.dart';
import 'package:sfuverce_app/models/item.dart';

import 'item_cart.dart';

class Cart {
  final ItemCart itemCart;
  final int quantity;

  Cart({
    this.itemCart,
    this.quantity,
  });
}
