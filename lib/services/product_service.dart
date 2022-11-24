import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';

mixin ProductService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<Item>> getItemFromFirestore() async {
    print("hi3");
    CollectionReference collection = _db.collection('products');
    List<Item> item;
    await collection.get().then((QuerySnapshot querySnapshot) {
      item = querySnapshot.docs.map((doc) {
        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          Item a = Item.fromJson(data);
          return a;
        }
        return Item();
      }).toList();
    });
    return item;
  }
}
