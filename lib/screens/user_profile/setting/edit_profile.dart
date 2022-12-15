import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:sfuverce_app/constants/backend_SignIn_SignUp/firebase_consts.dart';
// import 'package:sfuverce_app/constants/backend_SignIn_SignUp/images.dart';
// import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/screens/user_profile/setting/setting.dart';
import 'package:sfuverce_app/screens/authentication_screen/user_form.dart';
import '../../../services/database_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:cross_file/src/types/base.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String name = '';
  String email = '';
  String phone = '';
  String address = '';
  String avatar = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  File file;

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("users-form-data")
        .doc(FirebaseAuth.instance.currentUser.email)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()["name"];
          email = snapshot.data()["email"];
          phone = snapshot.data()["phone"];
          address = snapshot.data()["address"];
          avatar = snapshot.data()["avatar"];
        });
      }
    });
  }

  void initState() {
    super.initState();
    _getDataFromDatabase();
  }

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            iconSize: 30.0,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsOnePage()));
            }),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    file == null
                        ? InkWell(
                            onTap: () {
                              chooseImage();
                            },
                            child: Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1),
                                        offset: Offset(0, 10))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/user/user_avatar/avatar.png'),
                                  )),
                            ),
                          )
                        : Image.file(file),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: name,
                  prefixIcon: Icon(Icons.people),
                  border: myinputborder(),
                  enabledBorder: myinputborder(),
                  focusedBorder: myfocusborder(),
                  hintText: "Name",
                ),
              ),
              Container(height: 20),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: phone,
                  prefixIcon: Icon(Icons.phone_android),
                  border: myinputborder(),
                  enabledBorder: myinputborder(),
                  focusedBorder: myfocusborder(),
                  hintText: "Phone",
                ),
              ),
              Container(height: 20),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: address,
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: myinputborder(),
                  enabledBorder: myinputborder(),
                  focusedBorder: myfocusborder(),
                  hintText: "Address",
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsOnePage()));
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      updateProfile(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 24, 79, 175)),
                    ),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder myinputborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 136, 172, 235),
          width: 4,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Color.fromARGB(255, 28, 54, 141),
          width: 4,
        ));
  }

  chooseImage() async {
    XFile xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    print("file" + xfile.path);
    file = File(xfile.path);
    setState(() {});
  }

  Future<String> uploadImage() async {
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(
            FirebaseAuth.instance.currentUser.email + "_" + basename(file.path))
        .putFile(file);

    return taskSnapshot.ref.getDownloadURL();
  }

  updateProfile(BuildContext context) async {
    Map<String, dynamic> map = Map();
    if (file != null) {
      String url = await uploadImage();
      map['avatar'] = url;
    }
    map['name'] = _nameController.text;
    map['phone'] = _phoneController.text;
    map['address'] = _addressController.text;

    await FirebaseFirestore.instance
        .collection("users-form-data")
        .doc(FirebaseAuth.instance.currentUser.email)
        .update(map)
        .then((value) {
      Fluttertoast.showToast(
          msg: "Edit Sucessfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    });
    Navigator.pop(context);
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
