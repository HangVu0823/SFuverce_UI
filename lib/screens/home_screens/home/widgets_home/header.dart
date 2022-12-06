import 'package:flutter/material.dart';
import 'package:sfuverce_app/data/fake.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/search_bar.dart';
import 'package:sfuverce_app/services/database_service.dart';
import 'package:sfuverce_app/widgets/cart.dart';

import '../../../../models/models_cart/item_cart.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  FutureBuilder(
      future: DatabaseService().getItemCartFromFirestore(),
      builder: (context,AsyncSnapshot<List<ItemCart>> snapshot) {
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
                  Cart(numberOfItemsInCart: snapshot.data.length),
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
    );
  }
}
