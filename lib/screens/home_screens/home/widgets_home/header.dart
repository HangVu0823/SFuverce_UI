import 'package:flutter/material.dart';
import 'package:sfuverce_app/data/fake.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/search_bar.dart';
import 'package:sfuverce_app/services/database_service.dart';
import 'package:sfuverce_app/widgets/cart.dart';

import '../../../../models/models_cart/item_cart.dart';
import '../../../../models/parse.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int length = 0;
    return FutureBuilder(
        future: DatabaseService().getItemCartFromFirestore(),
        builder: (context, AsyncSnapshot<List<ItemCart>> snapshot) {
          if (snapshot.hasError) {
            print("Loi: ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            int tam = Parse.parseIntFromJson(snapshot.data.length);
            if (tam != length) length = tam;
            return buildItem(length);
          }
          return buildItem(length);
        });
  }

  Container buildItem(int length) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Furniture Shop',
                style: TextStyle(fontSize: 28.0, height: 1),
              ),
              Cart(numberOfItemsInCart: length),
            ],
          ),
          Text(
            'Get unique furniture for your home',
            style: TextStyle(fontSize: 15.0, height: 2, color: Colors.black38),
          ),
          SearchBar(),
        ],
      ),
    );
  }
}
