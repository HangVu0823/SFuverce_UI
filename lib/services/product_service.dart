import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sfuverce_app/screens/cart/option_modal_addCart.dart';

import '../models/item.dart';
import '../models/models_cart/cart.dart';
import '../models/models_cart/item_cart.dart';
import '../models/models_review/ReviewModal.dart';
import '../screens/reviews/reviews.dart';

mixin ProductService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<Item>> getItemWithCategory(String categoryId) async {
    CollectionReference collection =
        _db.collection('Categories').doc(categoryId).collection('Products');
    // print("Hi1 $categoryId");
    List<Item> item;
    await collection.get().then((QuerySnapshot querySnapshot) {
      item = querySnapshot.docs.map((doc) {
        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          Item a = Item.fromJson(data, doc.id, categoryId);

          return a;
        }
        return Item();
      }).toList();
    });
    return item;
  }

  Future<void> addItemToCart() async {
    CollectionReference collection = _db
        .collection('users-form-data')
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection('cart');
    await collection
        .doc(DataAddToCart.item.productId)
        .set(DataAddToCart.item.toJson())
        .then((value) {
      Fluttertoast.showToast(
          msg: "Add to cart successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }

  Future<List<CategoriesFirebase>> getCategoriesFromFirestore() async {
    //print("hi3");
    CollectionReference collection = _db.collection('Categories');
    List<CategoriesFirebase> categories;
    await collection.get().then((QuerySnapshot querySnapshot) {
      categories = querySnapshot.docs.map((doc) {
        //print("hello ban loi ban co o day khong");
        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          CategoriesFirebase a =
              CategoriesFirebase(title: data["title"], id: doc.id);
          //print("aaaa $a");
          return a;
        }
        return CategoriesFirebase(title: "", id: "");
      }).toList();
    });
    return categories;
  }

  Future<List<ItemCart>> getItemCartFromFirestore() async {
    //print("hi3");
    CollectionReference collection = _db.collection('users-form-data')
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection('cart');
    List<ItemCart> itemCart;
    await collection.get().then((QuerySnapshot querySnapshot) {
      itemCart = querySnapshot.docs.map((doc) {
        //print("hello ban loi ban co o day khong");
        if (doc.exists) {
           Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          ItemCart a = ItemCart.fromJson(data);
          //print("aaaa $a");
          return a;
        }
        return ItemCart();
      }).toList();
    });
    return itemCart;
  }

  Future<void> deleteItemCartFromFirestore(Cart cart) async {
    //print("hi3");
    _db.collection('users-form-data')
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection('cart').doc(cart.itemCart.productId).delete();
       
  }

  Future<List<ReviewModal>> getReviewModalFromFirestore(
      String categoryId, String productId) async {
    //print("hi3");
    CollectionReference collection = _db
        .collection('Categories')
        .doc(categoryId)
        .collection('Products')
        .doc(productId)
        .collection('reviews');
    List<ReviewModal> categories;
    await collection.get().then((QuerySnapshot querySnapshot) {
      categories = querySnapshot.docs.map((doc) {
        //print("hello ban loi ban co o day khong");
        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          ReviewModal a = ReviewModal.fromJson(data, doc.id);
          //print("aaaa $a");
          return a;
        }
        return ReviewModal();
      }).toList();
    });
    return categories;
  }
}
