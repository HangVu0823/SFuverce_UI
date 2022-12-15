import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sfuverce_app/models/models_cart/cart.dart';
import 'package:sfuverce_app/models/models_cart/user.dart';
import 'package:sfuverce_app/services/database_service.dart';
import '../../models/models_cart/item_cart.dart';
import '../check_out/shipping_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

// Widget deleteBgItem(){
//   return Container(
//     alignment: Alignment.centerRight,
//     padding: EdgeInsets.only(right: 20),
//     color: Colors.red,
//     child: Icon(Icons.delete,color: Colors.white,),
//     );

// }

class _CartScreenState extends State<CartScreen> {
  int quality = 0;
  void _incrementCount() {
    setState(() {
      quality++;
    });
  }

  void _decrementCount() {
    if (quality < 1) return;
    setState(() {
      quality--;
    });
  }

  void _delete() {
    setState(() {
      build(context);
    });
  }

  _buildCartItem(Cart cart) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      child: Slidable(
        actionPane: SlidableBehindActionPane(),
        actionExtentRatio: 0.25,
        secondaryActions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 25.0,
              height: 100.0,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
              child: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.white,
                onPressed: () {
                  FutureBuilder(
                      future:
                          DatabaseService().deleteItemCartFromFirestore(cart),
                      builder: (context, AsyncSnapshot<void> snapshot) {
                        print("object");
                        //   if (snapshot.hasError) {
                        //     print("Loi cmnr ${snapshot.error}");
                        //   }
                        //   if (snapshot.connectionState == ConnectionState.done) {
                        //     print("Helloooooooooooo");
                        //   }
                        //   return Center(child: CircularProgressIndicator());
                        // setState(() {
                        //   _buildCartItem(cart);
                        // });
                      });
                  setState(() {
                    _buildCartItem(cart);
                  });
                },
              ),
            ),
          )
        ],
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
                    width: 100.0,
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
                        image: AssetImage(cart.itemCart.imagePath),
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
                            cart.itemCart.name,
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
                                    cart.itemCart.color,
                                    style: TextStyle(
                                        color: Colors.black26, fontSize: 13.0),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                width: 140.0,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 4.0),
                                  // child: Text(
                                  //   cart.itemCart.type,
                                  //   style: TextStyle(
                                  //     color: Colors.black26,
                                  //     fontSize: 12.0,
                                  //   ),
                                  //   overflow: TextOverflow.ellipsis,
                                  // ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20.0,
                                width: 20.0,
                                child: Center(
                                  child: FloatingActionButton(
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                      size: 12.0,
                                    ),
                                    onPressed: _decrementCount,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "${cart.itemCart.number}",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 20.0,
                                width: 20.0,
                                child: Center(
                                  child: FloatingActionButton(
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                      size: 12.0,
                                    ),
                                    onPressed: _incrementCount,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 140.0,
                        child: Padding(
                          padding: EdgeInsets.only(left: 4.0),
                          child: Text(
                            '\$' + cart.itemCart.originalPrice.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  )
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
      future: DatabaseService().getItemCartFromFirestore(),
      builder: (context, AsyncSnapshot<List<ItemCart>> snapshot) {
        if (snapshot.hasError) {
          print("Loi: ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          List<Cart> listCart = [];
          for (int i = 0; i < snapshot.data.length; i++) {
            listCart.add(Cart(
                itemCart: snapshot.data[i], quantity: snapshot.data[i].number));
          }
          final currentUser = UserCart(
              name: FirebaseAuth.instance.currentUser.email, cart: listCart);
          double productPrice = 0;
          currentUser.cart.forEach((Cart cart) =>
              productPrice += (cart.quantity * cart.itemCart.originalPrice));
          double totalPrice = productPrice;

          return buildItem(context, currentUser, productPrice, totalPrice);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Scaffold buildItem(BuildContext context, currentUser, double productPrice,
      double totalPrice) {
    int deliveryPrice = currentUser.cart.isEmpty ? 0 : 20;
    totalPrice += deliveryPrice;
    return Scaffold(
      // bottomNavigationBar: AppBottomNavigation(),
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
          'Your Cart',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        // actions: [
        //   IconButton(
        //     icon: Icon(CustomIcons.short_text),
        //     onPressed: () {},
        //     color: Colors.black,
        //     iconSize: 30.0,
        //   )
        // ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Cart cart = currentUser.cart[index];
            return _buildCartItem(cart);
          }
          return SizedBox(
            height: 300.0,
          );
        },
        itemCount: currentUser.cart.length + 1,
      ),
      bottomSheet: Container(
        height: 260.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, -1), blurRadius: 20.0)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Product Cost',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '\$${productPrice.toString()}',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Cost',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    '\$${deliveryPrice.toString()}',
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Cost',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    '\$${totalPrice.toString()}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Container(
                height: 70.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 2.0),
                        blurRadius: 30.0,
                      )
                    ]),
                child: TextButton(
                    child: Text(
                      'Check Out',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => ShippingDetails()));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
