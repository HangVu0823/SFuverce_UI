import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/data/fake.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("hi1");
    Fake().addDataFurniture();

    print(" datafurniture ${Fake.furniture}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SFUVERCE',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: primaryColor,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageNavigation(),
    );
  }
}
