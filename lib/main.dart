import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/firebase_options.dart';
import 'package:sfuverce_app/splash/splash_screen.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SFUVERCE',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: primaryColor,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
