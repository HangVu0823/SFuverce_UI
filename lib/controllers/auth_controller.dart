// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:emart_app/consts/consts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// //import 'package:sfuverce_app/constants/constants.dart';

// class AuthController extends GetxController {
// //text controller

//   var isLoading = false.obs;

//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();

// //sign method.

//   Future<UserCredential> loginMethod({context}) async {
//     UserCredential userCredential;

//     try {
//       userCredential = await auth.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.toString());
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }

// //signUp method.

//   Future<UserCredential> signupMethod({email, password, context}) async {
//     UserCredential userCredential;

//     try {
//       userCredential = await auth.createUserWithEmailAndPassword(
//           email: email, password: email);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }

//   storeUserData({name, password, email}) async {
//     DocumentReference store =
//         firestore.collection(usersCollection).doc(currentUser.uid);
//     store.set({
//       'name': name,
//       'password': password,
//       'email': email,
//       'imageUrl': '',
//       'id': currentUser.uid,
//     });
//   }

// //signout method

//   signoutMethod(context) async {
//     try {
//       await auth.signOut();
//     } catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//   }
// }
