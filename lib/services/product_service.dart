import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/item.dart';

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
          Item a = Item.fromJson(data, doc.id);

          return a;
        }
        return Item.test();
      }).toList();
    });
    return item;
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
}
