import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sfuverce_app/models/models_favorites/item_favorites.dart';
import 'package:sfuverce_app/screens/cart/option_modal_addCart.dart';

import '../models/item.dart';
import '../models/models_cart/cart.dart';
import '../models/models_cart/item_cart.dart';
import '../models/models_favorites/favorites.dart';
import '../models/models_order/item_order.dart';
import '../models/models_order/order_information.dart';
import '../models/models_review/ReviewModal.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/reviews/reviews.dart';
import '../screens/user_profile/favorites/favorites_screen.dart';

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

  Future<void> deleteItemToCart() async {
    CollectionReference collectionReference = _db
        .collection('users-form-data')
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection('cart');
    var snapshots = await collectionReference.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> deleteItemCartFromFirestore(Cart cart) async {
    _db
        .collection('users-form-data')
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection('cart')
        .doc(cart.itemCart.productId)
        .delete()
        .then((value) {
      Fluttertoast.showToast(
          msg: " Delete product successfully",
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
    CollectionReference collection = _db
        .collection('users-form-data')
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

  Future<Item> getItemWithProductId(String categoryId, String productId) async {
    DocumentReference documentReference = _db
        .collection('Categories')
        .doc(categoryId)
        .collection('Products')
        .doc(productId);
    // print("Hi1 $categoryId");
    Item item;
    await documentReference.get().then((DocumentSnapshot doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        item = Item.fromJson(data, productId, categoryId);
      }
    });
    return item;
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

  Future<void> addFavoriteToCart() async {
    CollectionReference collection = _db
        .collection('users-form-data')
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection('favorites');
    await collection
        .doc(DataAddFavorites.item.productId)
        .set(DataAddFavorites.item.toJson())
        .then((value) {
      Fluttertoast.showToast(
          msg: "Added favorites",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }

  Future<List<ItemFavorites>> getItemFavoritesFromFirestore() async {
    //print("hi3");
    CollectionReference collection = _db
        .collection('users-form-data')
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection('favorites');
    List<ItemFavorites> itemFavorites;
    await collection.get().then((QuerySnapshot querySnapshot) {
      itemFavorites = querySnapshot.docs.map((doc) {
        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          ItemFavorites a = ItemFavorites.fromJson(data);
          return a;
        }
        return ItemFavorites();
      }).toList();
    });
    return itemFavorites;
  }

  Future<void> deleteItemFavoriteFromFirestore(Favorites favorites) async {
    _db
        .collection('users-form-data')
        .doc(FirebaseAuth.instance.currentUser.email)
        .collection('favorites')
        .doc(favorites.itemFavorites.productId)
        .delete()
        .then((value) {
      Fluttertoast.showToast(
          msg: " Unfavorite ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    });
  }

  Future<OrderInformation> getOrderWithId(String id) async {
    DocumentReference documentReference = _db.collection('Order').doc(id);
    // print("Hi1 $categoryId");
    OrderInformation order;
    await documentReference.get().then((DocumentSnapshot doc) {
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        order = OrderInformation.fromJson(data);
      }
    });
    return order;
  }

  Future<List<ItemOrder>> getItemOrderWithId(String id) async {
    CollectionReference collection =
        _db.collection('Order').doc(id).collection('item');

    List<ItemOrder> result;
    await collection.get().then((QuerySnapshot querySnapshot) {
      result = querySnapshot.docs.map((doc) {
        //print("hello ban loi ban co o day khong");
        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          ItemOrder a = ItemOrder.fromJson(data, doc.id);
          //print("aaaa $a");
          return a;
        }
        return ItemOrder();
      }).toList();
    });
    return result;
  }
}
