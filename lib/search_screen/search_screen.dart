import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:sfuverce_app/models/item.dart';
import 'package:sfuverce_app/screens/cart/details_screen.dart';
import 'package:sfuverce_app/screens/home_screens/category/category_screen.dart';
import 'package:sfuverce_app/screens/home_screens/category/widgets_category/furniture_grid_item.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/category_card.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/search_bar.dart';

class SearchSreen extends StatefulWidget {
  const SearchSreen({Key key}) : super(key: key);

  @override
  State<SearchSreen> createState() => _SearchSreenState();
}

class _SearchSreenState extends State<SearchSreen> {
  var inputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  inputText = value;
                  print(value);
                });
              },
              decoration: InputDecoration(
                icon: SvgPicture.asset('assets/icons/search.svg'),
                hintText: 'Search unique furniture...',
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 14.0,
                ),
                border: InputBorder.none,
              ),
            ),
            Expanded(
                child: Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("/Categories/E4dhADZRkTTWH6bHPsRt/Products")
                      .where("name", isGreaterThanOrEqualTo: inputText)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Something went wrong"),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // print(snapshot.data);

                      return Center(
                        child: Text("Loading"),
                      );
                    }

                    return ListView(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      return Card(
                          elevation: 10,
                          child: InkWell(
                            // onTap: () => Navigator.push(
                            //   context,
                            //   CupertinoPageRoute(
                            //       builder: (_) =>
                            //           DetailsScreen(item: Item, margin: Margi)),
                            // ),
                            onTap: () => {
                              print("a"),
                            },
                            child: ListTile(
                              title: Text(data['name']),
                              leading: Image.asset("${data['imagePath']}"),
                            ),
                          ));
                    }).toList());
                  }),
            ))
          ],
        ),
      )),
    );
  }
}
