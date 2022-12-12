import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

mixin AccountService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<String> getNameUserFromFirestore() async {
    String name = "";
    DocumentReference document = _db
        .collection('users-form-data')
        .doc(FirebaseAuth.instance.currentUser.email);
    await document.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data();
        name = data['name'].toString();
      }
    });

    return name;
  }
}
