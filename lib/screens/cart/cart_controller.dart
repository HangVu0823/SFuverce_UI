import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfuverce_app/constants/constants.dart';
import 'package:sfuverce_app/models/models_cart/item_cart.dart';
import 'package:sfuverce_app/services/database_service.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalController = TextEditingController();
  var phoneController = TextEditingController();

  var paymentIndex = 0.obs;
  dynamic productSnapshot;
  var products = [];

  caculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value =
          totalP.value + int.parse(data[i]['originalPrice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOder({orderPaymentMethod}) async {
    List<ItemCart> listItemCart = [];
    listItemCart = await DatabaseService().getItemCartFromFirestore();
    double sum = 20;
    for (int i = 0; i < listItemCart.length; i++) {
      sum += listItemCart[i].number * listItemCart[i].originalPrice;
    }
    String id_doc = DateTime.now().millisecondsSinceEpoch.toString();
    await firestore.collection("Order").doc(id_doc).set({
      'email': FirebaseAuth.instance.currentUser.email,
      // 'name': DatabaseService().getNameUserFromFirestore(),
      'order_code': id_doc,
      'order_date': FieldValue.serverTimestamp(),
      'order_by_state': stateController.text,
      'order_by_address': addressController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'shipping_method': "Labavie Delivery",
      'payment_method': orderPaymentMethod,
      'sum_price': sum,
    });
    for (int i = 0; i < listItemCart.length; i++) {
      await firestore.collection('Order').doc(id_doc).collection('item').add({
        'name': listItemCart[i].name,
        'number': listItemCart[i].number,
        'color': listItemCart[i].color,
        'price': listItemCart[i].originalPrice,
      });
    }
    await DatabaseService().deleteItemToCart();
  }

  clearCart() {}
}
