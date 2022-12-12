import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sfuverce_app/screens/home_screens/home/home_screen.dart';
import 'package:sfuverce_app/screens/search_screen/search_detail.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        title: TextFormField(
          onChanged: (value) {
            setState(() {
              inputText = value;
              print(value);
            });
          },
          decoration: InputDecoration(
            hintText: 'Search unique furniture...',
            hintStyle: TextStyle(
              color: Colors.black26,
              fontSize: 16.0,
            ),
            //suffixIcon: Icon(Icons.clear),
            border: InputBorder.none,
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: StreamBuilder(
                stream: (inputText != "" && inputText != null)
                    ? FirebaseFirestore.instance
                        .collectionGroup("Products")
                        .where("name", isGreaterThanOrEqualTo: inputText)
                        .snapshots()
                    : FirebaseFirestore.instance
                        .collectionGroup("Products")
                        .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  //print("A");
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Something went wrong"),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                          onTap: () {
                            return Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => SearchDetailProduct(
                                        // categoryId: "3YMCXDQiaBXjtAyI0B1l"
                                        categoryId:
                                            document.reference.parent.parent.id,
                                        productId: document.id.toString(),
                                        // productId: document.i,
                                      )),
                            );
                          },
                          child: ListTile(
                            title: Text(data['name']),
                          ),
                        ));
                  }).toList());
                }),
          ))
        ],
      ),
    );
  }
}
//       
//     child: Padding(
//   padding: const EdgeInsets.all(8.0),
