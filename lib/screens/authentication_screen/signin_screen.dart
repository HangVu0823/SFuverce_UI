import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfuverce_app/const/AppColors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sfuverce_app/screens/authentication_screen/signup_screen.dart';
import 'package:sfuverce_app/screens/authentication_screen/widget/customButton.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      var authCredential = userCredential.user;
      print(authCredential.uid);
      if (authCredential.uid.isNotEmpty) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => PageNavigation()));
      } else {
        Fluttertoast.showToast(msg: "Something is wrong");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Wrong password provided for that user.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 60, 153),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              // height: 150,
              // width: 100,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.light,
                        color: Colors.transparent,
                      ),
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
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
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                //width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Welcome Back",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              color: Color.fromARGB(255, 49, 60, 153)),
                        ),
                        Text(
                          "Glad to see you back my buddy.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFBBBBBB),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 48,
                              width: 41,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 103, 140, 196),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: "thed9954@gmail.com",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF414041),
                                  ),
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 103, 140, 196),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 48,
                              width: 41,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 103, 140, 196),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: "password must be 6 character",
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF414041),
                                  ),
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 103, 140, 196),
                                  ),
                                  suffixIcon: _obscureText == true
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = false;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            size: 20,
                                          ))
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = true;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.visibility_off,
                                            size: 20,
                                          )),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        SizedBox(
                          // width: 1,
                          // height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              signIn();
                            },
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 103, 140, 196),
                              elevation: 3,
                            ),
                          ),
                        ),
                        // elevated button
                        // customButton(
                        //   "Sign In",
                        //   () {
                        //     signIn();
                        //   },
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFBBBBBB),
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                " Sign Up",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 49, 60, 153),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
