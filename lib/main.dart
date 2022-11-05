import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/screens/home_screens/home/home_screen.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(Fake.furniture);
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
