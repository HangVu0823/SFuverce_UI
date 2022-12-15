import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfuverce_app/constants/backend_SignIn_SignUp/firebase_consts.dart';
import 'package:sfuverce_app/screens/delivery/trackorder.dart';
import 'package:sfuverce_app/screens/user_profile/favorites/favorites_screen.dart';
import 'package:sfuverce_app/screens/user_profile/setting/setting.dart';
import 'package:sfuverce_app/custom-icons/custom-icons.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';

import '../../services/account_service.dart';
import '../cart/cart_screen.dart';
import '../../services/database_service.dart';

class UserScreen extends StatefulWidget {
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final user = FirebaseAuth.instance.currentUser;
  String name = 'User';
  String email = '********';
  String urlPhoto = "null";
  String phone = '********';
  String address = '******';

  Future<int> _getDataFromDatabse() async {
    await FirebaseFirestore.instance
        .collection("users-form-data")
        .doc(FirebaseAuth.instance.currentUser.email)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()["name"];
          //email = snapshot.data()["email"];
          if (snapshot.data()["avatar"] == null)
            urlPhoto = "null";
          else
            urlPhoto = snapshot.data()["avatar"];
          phone = snapshot.data()["phone"];
          address = snapshot.data()["address"];
        });
      }
    });
    return 1;
  }

  void initState() {
    super.initState();
    // _getDataFromDatabse();
  }

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
                  MaterialPageRoute(builder: (context) => PageNavigation()));
            }),
        title: Text(
          'User Profile',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: double.infinity,
                    color: Color.fromARGB(255, 21, 65, 131),
                  ),
                  Positioned(
                    bottom: 50.0,
                    right: 100.0,
                    child: Container(
                      width: 400.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          color: Color.fromARGB(255, 47, 98, 156)
                              .withOpacity(0.5)),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 150.0,
                    child: Container(
                      width: 300.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          color: Colors.blue[700].withOpacity(0.5)),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      FutureBuilder(
                          future: _getDataFromDatabse(),
                          builder: (context, AsyncSnapshot<int> snapshot) {
                            if (snapshot.hasError) {
                              return Text(snapshot.error);
                            }
                            if (snapshot.hasData) {
                              return Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  CircleAvatar(
                                    radius: 37,
                                    backgroundImage: (urlPhoto == "null")
                                        ? AssetImage(
                                            'assets/images/user/user_avatar/avatar.png')
                                        : NetworkImage(urlPhoto),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Quicksand',
                                              fontSize: 21.0)),
                                      Text(phone,
                                          style: TextStyle(
                                              color: Colors.grey[300],
                                              fontFamily: 'Quicksand',
                                              fontSize: 15.0))
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                      icon: Icon(
                                        Icons.settings,
                                        color: Colors.white,
                                        size: 30.0,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SettingsOnePage()));
                                      }),
                                ],
                              );
                            }
                            return Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 10.0,
                                ),
                                CircleAvatar(
                                  radius: 37,
                                  backgroundImage: AssetImage(
                                      'assets/images/user/user_avatar/avatar.png'),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("User",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Quicksand',
                                            fontSize: 21.0)),
                                    Text("(+84)xxx.xxx.xxx",
                                        style: TextStyle(
                                            color: Colors.grey[300],
                                            fontFamily: 'Quicksand',
                                            fontSize: 15.0))
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                    icon: Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingsOnePage()));
                                    }),
                              ],
                            );
                          }),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite),
                                  color: Colors.white,
                                  iconSize: 35.0,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FavoriteScreen()));
                                  }),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text('Favorites',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0))
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.account_balance_wallet),
                                color: Colors.white,
                                iconSize: 35.0,
                                onPressed: () => null,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text('Wallet',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0))
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.print),
                                color: Colors.white,
                                iconSize: 35.0,
                                onPressed: () => null,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text('Footprint',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0))
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.laptop),
                                color: Colors.white,
                                iconSize: 35.0,
                                onPressed: () => null,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text('Coupon',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Quicksand',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              customCards('Pending payment', '5',
                                  'assets/images/user/card.png'),
                              customCards('To be shipped', '2',
                                  'assets/images/user/box.png'),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    child: customCards(
                        'To be received', '8', 'assets/images/user/trucks.png'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TrackOrder()));
                    },
                  ),
                  // GestureDetector(
                  //   onTap: () => TrackOrder(),
                  // ),
                  customCards('Return/replace', '0',
                      'assets/images/user/returnbox.png'),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              customlistDetails('Gift card', Icons.account_box, Colors.red[100],
                  Colors.red[400]),
              customlistDetails('Bank card', Icons.credit_card,
                  Colors.orange[200], Colors.orange[400]),
              customlistDetails('Replacement code', Icons.sim_card,
                  Colors.red[50], Colors.red[300]),
              customlistDetails('Consulting collection', Icons.dashboard,
                  Colors.blue[100], Colors.blue[400]),
              customlistDetails('Customer service', Icons.people,
                  Colors.orange[100], Colors.orange[300])
            ],
          )
        ],
      ),
    );
  }

  Widget customCards(String title, String qty, String imagePath) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        height: 125.0,
        width: (MediaQuery.of(context).size.width / 2.0) - 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Image.asset(imagePath,
                  fit: BoxFit.cover, width: 50.0, height: 50.0),
            ),
            SizedBox(height: 2.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 3.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(qty,
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 15.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget customlistDetails(
      String title, IconData icon, Color backgroundColor, Color iconColor) {
    return ListTile(
      title: Text(title,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand',
              fontSize: 18.0)),
      leading: CircleAvatar(
        backgroundColor: backgroundColor,
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.black),
    );
  }
}
