import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/item.dart';

mixin ProductService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<Item>> getItemFromFirestore() async {
    //print("hi3");
      final collection = FirebaseFirestore.instance.collection('products');
    // CollectionReference collection = _db.collection('products');
    List<Item> item;
    await collection.get().then((QuerySnapshot querySnapshot) {
      item = querySnapshot.docs.map((doc) {
        //print("hello ban loi ban co o day khong");
        if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          Item a = Item.fromJson(data);
          //print("aaaa $a");
          return a;
        }
        return Item.test();
      }).toList();
    });
    return item;
  }
}
