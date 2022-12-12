import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sfuverce_app/screens/cart/cart_screen.dart';
import 'package:sfuverce_app/models/item.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/screens/chat/chat_products/chat_detailsScreen.dart';
import 'package:sfuverce_app/screens/reviews/reviews.dart';
import 'package:sfuverce_app/screens/reviews/reviewsUI.dart';
import 'package:sfuverce_app/services/database_service.dart';
import '../cart/details_screen.dart';

class SearchDetailProduct extends StatelessWidget {
  SearchDetailProduct({
    Key key,
    @required this.categoryId,
    @required this.productId,
  }) : super(key: key);

  Item item;
  final String categoryId;
  final String productId;

  Future<Item> loadDataReview() async {
    item = await DatabaseService().getItemWithProductId(categoryId, productId);
    // List<ReviewModal> result = [];
    // result = await DatabaseService()
    //     .getReviewModalFromFirestore(item.categoryId, item.productId);
    return item;
  }

  @override
  Widget build(BuildContext context) {
    bool isMore = false;
    return FutureBuilder(
        future: loadDataReview(),
        builder: (context, AsyncSnapshot<Item> snapshot) {
          if (snapshot.hasError) {
            print("Loi cmnr ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            // print(snapshot.data.length);
            return DetailsScreen(
              item: snapshot.data,
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  // Scaffold buildItem(BuildContext context,
  //     AsyncSnapshot<List<ReviewModal>> snapshot, bool isMore) {
  //   return Scaffold(
  //     body: ListView(
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Stack(
  //               children: [
  //                 Container(
  //                   height: 300.0,
  //                   width: double.infinity,
  //                   //color: item.backgorundColor,
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(top: 30.0),
  //                     child: Image(
  //                       image: AssetImage(item.imagePath),
  //                       fit: BoxFit.scaleDown,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(
  //                     horizontal: 15.0,
  //                     vertical: 10.0,
  //                   ),
  //                   child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       IconButton(
  //                         icon: Icon(Icons.arrow_back_ios),
  //                         iconSize: 30.0,
  //                         onPressed: () => Navigator.pop(context),
  //                       ),
  //                       Row(
  //                         children: [
  //                           Icon(
  //                             Icons.search,
  //                             size: 30.0,
  //                           ),
  //                           IconButton(
  //                             icon: Icon(Icons.shopping_bag_outlined),
  //                             iconSize: 30.0,
  //                             onPressed: () => Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                 builder: (_) => CartScreen(),
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Container(
  //                   height: 40,
  //                   width: 19,
  //                 ),
  //                 Container(
  //                   height: 65,
  //                   width: MediaQuery.of(context).size.width - 85,
  //                   child: Align(
  //                     alignment: Alignment.bottomLeft,
  //                     child: Text(
  //                       item.name,
  //                       maxLines: 1,
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 28.0,
  //                         letterSpacing: 1.8,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Container(
  //                   padding: EdgeInsets.only(left: 10, top: 15, right: 5),
  //                   child: Icon(
  //                     Icons.view_in_ar,
  //                     color: Colors.black,
  //                     size: 50.0,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(16.0),
  //               child: Column(
  //                 //mainAxisAlignment: MainAxisAlignment.start,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Wrap(
  //                     spacing: 3,
  //                     crossAxisAlignment: WrapCrossAlignment.start,
  //                     children: [
  //                       Text(
  //                         '${Item.format(item.price)}',
  //                         style: TextStyle(
  //                           fontSize: 28,
  //                           color: primaryColor,
  //                           height: 1.5,
  //                         ),
  //                       ),
  //                       if (item.discountPercent != null)
  //                         Text(
  //                           '${Item.format(item.originalPrice)}',
  //                           style: TextStyle(
  //                             fontSize: 22,
  //                             height: 1.5,
  //                             decoration: TextDecoration.lineThrough,
  //                             color: Colors.black38,
  //                           ),
  //                         )
  //                     ],
  //                   ),
  //                   Container(
  //                     margin: EdgeInsets.only(top: 5),
  //                     child: Row(
  //                       children: [
  //                         RatingBar.builder(
  //                           initialRating: item.rating,
  //                           minRating: 1,
  //                           itemSize: 28,
  //                           ignoreGestures: true,
  //                           allowHalfRating: true,
  //                           itemCount: 5,
  //                           unratedColor: Colors.amber[100],
  //                           itemBuilder: (context, _) => Icon(
  //                             Icons.star,
  //                             size: 2,
  //                             color: Colors.amber,
  //                           ),
  //                           onRatingUpdate: (rating) => print(rating),
  //                         ),
  //                         SizedBox(width: 5),
  //                         Text(
  //                           '${item.rating}',
  //                           style: TextStyle(fontSize: 20),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(left: 20.0),
  //               child: Text('Details', style: TextStyle(fontSize: 24.0)),
  //             ),
  //             SizedBox(
  //               height: 5.0,
  //             ),
  //             Padding(
  //               padding: EdgeInsets.only(left: 20.0, right: 10.0),
  //               child: Text(
  //                 item.description,
  //                 style: TextStyle(fontSize: 18.0, color: Colors.black38),
  //               ),
  //             ),
  //             SizedBox(height: 40.0),
  //             Row(
  //               children: [
  //                 Container(
  //                   height: 30,
  //                   width: MediaQuery.of(context).size.width - 130,
  //                   margin: EdgeInsets.only(left: 19),
  //                   child: Text(
  //                     "Reviews",
  //                     style: TextStyle(
  //                       fontSize: 22.0,
  //                       color: Color.fromRGBO(0, 0, 0, 1),
  //                     ),
  //                   ),
  //                 ),
  //                 (snapshot.data.length != 0 && snapshot.data.length > 3)
  //                     ? Container(
  //                         padding: EdgeInsets.only(left: 10, right: 5),
  //                         child: InkWell(
  //                           child: Wrap(
  //                             crossAxisAlignment: WrapCrossAlignment.center,
  //                             children: [
  //                               Text(
  //                                 'View all',
  //                                 style: TextStyle(
  //                                     fontSize: 18.0,
  //                                     height: 1,
  //                                     color: primaryColor),
  //                               ),
  //                               Padding(
  //                                 padding: EdgeInsets.only(right: 10.0),
  //                                 child: Icon(Icons.arrow_forward,
  //                                     color: primaryColor),
  //                               ),
  //                             ],
  //                           ),
  //                           onTap: () {
  //                             Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                 builder: (_) => Reviews(data: snapshot.data),
  //                               ),
  //                             );
  //                           },
  //                         ),
  //                       )
  //                     : Container(),
  //               ],
  //             ),
  //             snapshot.data.length > 0
  //                 ? ListView.separated(
  //                     shrinkWrap: true,
  //                     physics: NeverScrollableScrollPhysics(),
  //                     padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
  //                     itemCount:
  //                         3 < snapshot.data.length ? 3 : snapshot.data.length,
  //                     itemBuilder: (context, index) {
  //                       return ReviewsUI(
  //                         image: snapshot.data[index].image,
  //                         name: snapshot.data[index].name,
  //                         date: snapshot.data[index].date,
  //                         comments: snapshot.data[index].comments,
  //                         rating: snapshot.data[index].rating,
  //                         onPressed: () => print("More Action $index"),
  //                         onTap: () => () {
  //                           isMore = !isMore;
  //                         },
  //                         isLess: isMore,
  //                       );
  //                     },
  //                     separatorBuilder: (context, index) {
  //                       return Divider(
  //                         thickness: 2.0,
  //                         color: kDarkColor,
  //                       );
  //                     },
  //                   )
  //                 : Container(
  //                     padding: EdgeInsets.only(left: 20.0),
  //                     child: Text(
  //                       "Empty Reviews",
  //                       style: TextStyle(
  //                         fontSize: 16.0,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //             SizedBox(
  //               height: 40.0,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Container(
  //                   height: 60.0,
  //                   width: 100.0,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20.0),
  //                       color: Colors.white,
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.black12,
  //                           offset: Offset(0, 2),
  //                           blurRadius: 20.0,
  //                         )
  //                       ]),
  //                   child: Center(
  //                     child: Text(
  //                       'H: ' + item.height.toString() + '"',
  //                       style: TextStyle(
  //                         fontSize: 16.0,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Container(
  //                   height: 60.0,
  //                   width: 100.0,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20.0),
  //                       color: Colors.white,
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.black12,
  //                           offset: Offset(0, 2),
  //                           blurRadius: 20.0,
  //                         )
  //                       ]),
  //                   child: Center(
  //                     child: Text(
  //                       'W: ' + item.weight.toString() + ' lbs',
  //                       style: TextStyle(
  //                         fontSize: 16.0,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Container(
  //                   height: 60.0,
  //                   width: 100.0,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20.0),
  //                       color: Colors.white,
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.black12,
  //                           offset: Offset(0, 2),
  //                           blurRadius: 20.0,
  //                         )
  //                       ]),
  //                   child: Center(
  //                     child: Text(
  //                       item.color,
  //                       style: TextStyle(
  //                         fontSize: 16.0,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 50.0,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Container(
  //                   height: 60.0,
  //                   width: 80.0,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20.0),
  //                       color: Theme.of(context).primaryColor,
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.black12,
  //                           offset: Offset(0, 2),
  //                           blurRadius: 20.0,
  //                         )
  //                       ]),
  //                   child: Center(
  //                     child: IconButton(
  //                       icon: Icon(Icons.question_answer),
  //                       iconSize: 25.0,
  //                       color: Colors.white,
  //                       onPressed: () => Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (_) => ChatDetailScreen(item: item),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),

  //                 //add cart
  //                 Container(
  //                     height: 60.0,
  //                     width: 90.0,
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(20.0),
  //                         color: Theme.of(context).primaryColor,
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Colors.black12,
  //                             offset: Offset(0, 2),
  //                             blurRadius: 20.0,
  //                           )
  //                         ]),
  //                     child: IconButton(
  //                       icon: Icon(
  //                         Icons.add_shopping_cart,
  //                         color: Colors.white,
  //                         size: 30.0,
  //                       ),
  //                       onPressed: () {
  //                         _settingModalBottomSheet(context);
  //                       },
  //                     )),

  //                 Container(
  //                   height: 60.0,
  //                   width: 160.0,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20.0),
  //                       color: Theme.of(context).primaryColor,
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.black12,
  //                           offset: Offset(0, 2),
  //                           blurRadius: 20.0,
  //                         )
  //                       ]),
  //                   child: Center(
  //                     child: Text(
  //                       'Buy Now',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.white,
  //                         fontSize: 20.0,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Container(
  //                   height: 60.0,
  //                   width: 60.0,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20.0),
  //                       color: Theme.of(context).primaryColor,
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: Colors.black12,
  //                           offset: Offset(0, 2),
  //                           blurRadius: 20.0,
  //                         )
  //                       ]),
  //                   child: Center(
  //                       child: Icon(
  //                     Icons.favorite_border,
  //                     color: Colors.white,
  //                     size: 30.0,
  //                   )),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// void _settingModalBottomSheet(context) {
//   showModalBottomSheet(
//       isScrollControlled: true,
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       context: context,
//       builder: (BuildContext bc) {
//         return OptionModal_AddCart();
//       });
// }
