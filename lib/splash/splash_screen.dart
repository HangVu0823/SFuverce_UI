import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../const/AppColors.dart';
import '../screens/authentication_screen/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
            context, CupertinoPageRoute(builder: (_) => LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.9],
          colors: [
            Color.fromARGB(255, 52, 58, 161),
            Color.fromARGB(255, 140, 171, 216),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 90.0),
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //             child: Image.asset(
            //   'assets/images/logo.png',
            //   fit: BoxFit.scaleDown,
            // ),
            //Image.asset('assets/images/logo.png'),
            Container(
              height: 62,
              width: 62,
              child: Image.asset('assets/images/logo2.png'),
            ),
            Text(
              "SFUVERCE",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                shadows: <Shadow>[
                  // Shadow(
                  //   offset: Offset(5.0, 5.0),
                  //   blurRadius: 8.0,
                  //   color: Color.fromARGB(123, 74, 95, 202),
                  // ),
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 8.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Color.fromARGB(255, 157, 184, 225),

    //   body: SafeArea(
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [

    //           Text(
    //             "SFUVERCE",
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.bold,
    //                 fontSize: 44),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           CircularProgressIndicator(
    //             color: Colors.white,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
