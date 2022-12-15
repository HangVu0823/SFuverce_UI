import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sfuverce_app/models/models_favorites/favorites.dart';
import 'package:sfuverce_app/models/models_favorites/item_favorites.dart';
import 'package:sfuverce_app/models/models_favorites/user.dart';
import 'package:sfuverce_app/services/database_service.dart';

import '../../../models/item.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void _delete() {
    setState(() {
      build(context);
    });
  }

  _buildFavoriteItem(Favorites favorites) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      child: Slidable(
        actionPane: SlidableBehindActionPane(),
        actionExtentRatio: 0.25,
        child: Container(
          height: 100.0,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 20.0,
                )
              ]),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    width: 80.0,
                    height: 94.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                      //color: cart.itemCart.backgorundColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Image(
                        height: 200.0,
                        width: 200.0,
                        image: AssetImage(favorites.itemFavorites.imagePath),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.0, top: 15.0),
                          child: Text(
                            favorites.itemFavorites.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 140.0,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    favorites.itemFavorites.color,
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 13.0),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 140.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: Text(
                            '\$' +
                                favorites.itemFavorites.originalPrice
                                    .toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    width: 100.0,
                    height: 94.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30.0,
                      ),
                      onPressed: () {
                        FutureBuilder(
                            future: DatabaseService()
                                .deleteItemFavoriteFromFirestore(favorites),
                            builder: (context, AsyncSnapshot<void> snapshot) {
                              print("object");
                            });
                        setState(() {
                          _buildFavoriteItem(favorites);
                        });
                      },
                      splashColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseService().getItemFavoritesFromFirestore(),
      builder: (context, AsyncSnapshot<List<ItemFavorites>> snapshot) {
        if (snapshot.hasError) {
          print("Loi: ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<Favorites> listFavorite = [];
          for (int i = 0; i < snapshot.data.length; i++) {
            listFavorite.add(Favorites(
                itemFavorites: snapshot.data[i],
                quantity: snapshot.data[i].number));
          }
          final currentUser = UserFavorites(
              name: FirebaseAuth.instance.currentUser.email,
              favorites: listFavorite);
          double productPrice = 0;
          currentUser.favorites.forEach((Favorites favorites) => productPrice +=
              (favorites.quantity * favorites.itemFavorites.originalPrice));
          double totalPrice = productPrice;

          return buildItem(context, currentUser, productPrice, totalPrice);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Scaffold buildItem(BuildContext context, currentUser, double productPrice,
      double totalPrice) {
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
            if (Navigator.canPop(context)) Navigator.pop(context);
          },
        ),
        title: Text(
          'Your Favorites',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.favorites.length) {
            Favorites favorites = currentUser.favorites[index];
            return _buildFavoriteItem(favorites);
          }
          return SizedBox(
            height: 300.0,
          );
        },
        itemCount: currentUser.favorites.length + 1,
      ),
    );
  }
}

class DataAddFavorites {
  static Item item;
}
