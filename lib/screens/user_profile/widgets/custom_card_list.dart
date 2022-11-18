import 'package:flutter/material.dart';
import 'package:sfuverce_app/models/models_user/user.dart';

final customCardList = [
  UserModal(
    title: "Pending payment",
    qty: "5",
    imagePath: 'assets/images/user/card.png',
  ),
  UserModal(
    title: "To be shipped",
    qty: "2",
    imagePath: 'assets/images/user/box.png',
  ),
  UserModal(
    title: 'To be received',
    qty: "8",
    imagePath: 'assets/images/user/trucks.png',
  ),
  UserModal(
    title: 'Return/replace',
    qty: "0",
    imagePath: 'assets/images/user/returnbox.png'
  ),
];