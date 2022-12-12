import 'dart:math';

class UserModal {
  String title;
  String qty;
  String imagePath;

  UserModal({
    this.qty,
    this.title,
    this.imagePath,
  });
}

class Account {
  String name;
  String phone;
  String dob;
  String gender;
  String age;
  String email;

  Account({
    this.age,
    this.dob,
    this.gender,
    this.name,
    this.phone,
    this.email,
  });

  factory Account.fromJson(Map<String, dynamic> data) {
    String name = data['name'];
    String phone = data['phone'];
    String dob = data['dob'];
    String gender = data['gender'];
    String age = data['age'];
    String email = data['email'];

    return Account(
      name: name,
      phone: phone,
      dob: dob,
      gender: gender,
      age: age,
      email: email,
    );
  }
}
