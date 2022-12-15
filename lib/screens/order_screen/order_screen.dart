// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:sfuverce_app/constants/constants.dart';
// import 'package:sfuverce_app/screens/order_screen/order_details.dart';
// import 'package:sfuverce_app/services/account_service.dart';

// class OrderScreen extends StatelessWidget {
//   const OrderScreen({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   title:
//         //       "My Orders".text.color(darkFontGrey).fontFamily(semibold).make(),
//         // ),
//         body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             color: primaryColor,
//             padding: EdgeInsets.only(top: 50),
//             child: Text(
//               "My Order",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 24, color: Colors.white),
//             )),
//         StreamBuilder(
//           stream: AccountService.getAllOrders(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) {
//               print("Loi: ${snapshot.error}");
//             }
//             if (snapshot.connectionState == ConnectionState.done) {
//               // print(snapshot.data);
//               if (snapshot.data.docs.isEmpty) {
//                 return "No orders yet!".text.color(darkFontGrey).makeCentered();
//               }
//               var data = snapshot.data.docs;
//               return ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     leading: "${index + 1}"
//                         .text
//                         .fontFamily(bold)
//                         .color(darkFontGrey)
//                         .xl
//                         .make(),
//                     title: data[index]['order_code']
//                         .toString()
//                         .text
//                         .color(redColor)
//                         .fontFamily(semibold)
//                         .make(),
//                     subtitle: data[index]['sum_price']
//                         .toString()
//                         .numCurrency
//                         .text
//                         .fontFamily(bold)
//                         .make(),
//                     trailing: IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             CupertinoPageRoute(
//                                 builder: (context) => OrderDetails(
//                                       id_order: data[index]['order_code'],
//                                     )));
//                         //print(document);
//                       },
//                       icon: const Icon(
//                         Icons.arrow_forward_ios_rounded,
//                         color: darkFontGrey,
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }

//             return Center(child: CircularProgressIndicator());

//             // print(data);
//           },
//         ),
//       ],
//     ));
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sfuverce_app/constants/constants.dart';
import 'package:sfuverce_app/screens/order_screen/order_details.dart';
import 'package:sfuverce_app/services/account_service.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              "My Orders".text.color(darkFontGrey).fontFamily(semibold).make(),
          automaticallyImplyLeading: false,
        ),
        body: StreamBuilder(
          stream: AccountService.getAllOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                
            if (!snapshot.hasData) {
              print(snapshot.data);
              return Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,

                  /// Required, The loading type of the widget
                  colors: const [Colors.blue],

                  /// Optional, The color collections
                  strokeWidth: 1,

                  /// Optional, The stroke of the line, only applicable to widget which contains line
                  backgroundColor: Colors.white,

                  /// Optional, Background of the widget
                  pathBackgroundColor: Colors.white,
                ),
              );
            } else if (snapshot.data.docs.isEmpty) {
              return "No orders yet!".text.color(darkFontGrey).makeCentered();
            } else {
              var data = snapshot.data.docs;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: "${index + 1}"
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .xl
                        .make(),
                    title: data[index]['order_code']
                        .toString()
                        .text
                        .color(redColor)
                        .fontFamily(semibold)
                        .make(),
                    subtitle: data[index]['sum_price']
                        .toString()
                        .numCurrency
                        .text
                        .fontFamily(bold)
                        .make(),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => OrderDetails(
                                      id_order: data[index]['order_code'],
                                    )));
                        //print(document);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: darkFontGrey,
                      ),
                    ),
                  );
                  print(data);
                },
              );
            }
          },
        ));
  }
}
