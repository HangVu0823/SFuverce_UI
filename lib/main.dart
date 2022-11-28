import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/data/fake.dart';
import 'package:sfuverce_app/firebase_options.dart';
import 'package:sfuverce_app/screens/home_screens/category/widgets_category/furniture_grid_item.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print("hi1");
    // Fake().addDataFurniture();

    // print("datafurniture ${Fake.furniture}");
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
