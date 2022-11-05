import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sfuverce_app/screens/cart/cart_screen.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';
import 'package:sfuverce_app/models/item.dart';
import 'package:sfuverce_app/constants/colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key key,
    @required this.item,
    @required this.margin,
  }) : super(key: key);

  final Item item;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: AppBottomNavigation(),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300.0,
                    width: double.infinity,
                    color: item.backgorundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Image(
                        image: AssetImage(item.imagePath),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 30.0,
                          onPressed: () => Navigator.pop(context),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 30.0,
                            ),
                            IconButton(
                              icon: Icon(Icons.shopping_bag_outlined),
                              iconSize: 30.0,
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CartScreen(),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 19,
                  ),
                  Container(
                    height: 65,
                    width: MediaQuery.of(context).size.width - 85,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        item.name,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                          letterSpacing: 1.8,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 15, right: 5),
                    child: Icon(
                      Icons.view_in_ar,
                      color: Colors.black,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 3,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Text(
                          '${Item.format(item.price)}',
                          style: TextStyle(
                            fontSize: 28,
                            color: primaryColor,
                            height: 1.5,
                          ),
                        ),
                        if (item.discountPercent != null)
                          Text(
                            '${Item.format(item.originalPrice)}',
                            style: TextStyle(
                              fontSize: 22,
                              height: 1.5,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.black38,
                            ),
                          )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: item.rating,
                            minRating: 1,
                            itemSize: 28,
                            ignoreGestures: true,
                            allowHalfRating: true,
                            itemCount: 5,
                            unratedColor: Colors.amber[100],
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              size: 2,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) => print(rating),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${item.rating}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Details',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 10.0),
                child: Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black38,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        'H: ' + item.height.toString() + '"',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        'W: ' + item.weight.toString() + ' lbs',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        item.color,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //add cart
                  Container(
                      height: 60.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Theme.of(context).primaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 20.0,
                            )
                          ]),
                      child: IconButton(
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Added to your Cart !',
                                textAlign: TextAlign.center,
                              ),
                              //backgroundColor: Colors.grey,
                            ),
                          );
                        },
                      )),

                  Container(
                    height: 60.0,
                    width: 180.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 20.0,
                          )
                        ]),
                    child: Center(
                        child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30.0,
                    )),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
