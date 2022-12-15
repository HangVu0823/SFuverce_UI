import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfuverce_app/constants/constants.dart';
import 'package:sfuverce_app/models/models_order/order_information.dart';
import 'package:sfuverce_app/screens/order_screen/components/order_place_details.dart';
import 'package:sfuverce_app/screens/order_screen/components/order_status.dart';
import 'package:sfuverce_app/services/account_service.dart';
import 'package:sfuverce_app/services/database_service.dart';
import 'package:sfuverce_app/services/product_service.dart';

import '../../models/models_order/item_order.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key key, this.id_order}) : super(key: key);
  final String id_order;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DatabaseService().getOrderWithId(id_order),
        builder: (context, AsyncSnapshot<OrderInformation> snapshot) {
          if (snapshot.hasError) {
            print("Loi ${snapshot.error}");
          }
          if (snapshot.hasData) {
            return buildItem(snapshot.data);
          }
          return buildItem(OrderInformation().template());
        });
  }

  Scaffold buildItem(OrderInformation data) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .align(TextAlign.center)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              orderStatus(
                  color: redColor,
                  icon: Icons.done,
                  title: "Placed",
                  showDone: true),
              orderStatus(
                  color: Colors.blue,
                  icon: Icons.thumb_up,
                  title: "Order Confirmed",
                  showDone: false),
              orderStatus(
                  color: Colors.orange,
                  icon: Icons.car_crash,
                  title: "On Delivery",
                  showDone: false),
              orderStatus(
                  color: Colors.pink,
                  icon: Icons.done_all_rounded,
                  title: "Delivered",
                  showDone: false),
              //const Divider(),
              10.heightBox,
              Column(
                children: [
                  orderPlaceDetails(
                    title1: "Order Code",
                    d1: "${data.order_code}",
                    title2: "Shipping Method",
                    d2: "${data.shipping_method}",
                  ),
                  10.heightBox,
                  orderPlaceDetails(
                      title1: "Order Date",
                      d1: "${DateFormat('dd-MM-yyyy – kk:mm').format(data.order_date)}",
                      //DateFormat().add_yMd(),format((data['order_date].toDate())),
                      title2: "Payment Method",
                      d2: "${data.payment_method}"),
                  10.heightBox,
                  orderPlaceDetails(
                      title1: "Status Order",
                      d1: (data.payment_method == "Paypal" ||
                              data.payment_method == "Stripe")
                          ? "Paid"
                          : "Unpaid",
                      //DateFormat().add_yMd(),format((data['order_date].toDate())),
                      title2: "",
                      d2: ""),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Shipping Address".text.fontFamily(semibold).make(),
                            "${data.email}".text.make(),
                            "${data.order_by_address}".text.make(),
                            "${data.order_by_city}".text.make(),
                            "${data.order_by_phone}".text.make(),
                            "${data.order_by_state}".text.make(),
                            "${DateFormat('dd-MM-yyyy – kk:mm').format(data.order_date)}"
                                .text
                                .make(),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Total Amount"
                                  .text
                                  .size(20)
                                  .fontFamily(semibold)
                                  .make(),
                              "${data.sum_price}"
                                  .toString()
                                  .numCurrency
                                  .text
                                  .size(35)
                                  .fontFamily(bold)
                                  .make(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ).box.shadowMd.white.make(),
              const Divider(),
              10.heightBox,
              "Ordered Product"
                  .text
                  .size(20)
                  .color(darkFontGrey)
                  .fontFamily(semibold)
                  .makeCentered(),
              10.heightBox,
              FutureBuilder(
                  future: DatabaseService().getItemOrderWithId(id_order),
                  builder: (context, AsyncSnapshot<List<ItemOrder>> snapshot) {
                    if (snapshot.hasError) return Text("Loi ${snapshot.error}");
                    if (snapshot.hasData) {
                      return ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: List.generate(snapshot.data.length, (index) {
                          return Column(
                            children: [
                              orderPlaceDetails(
                                  d1: snapshot.data[index].name,
                                  d2: snapshot.data[index].color,
                                  title1: snapshot.data[index].price,
                                  title2: snapshot.data[index].number),
                            ],
                          );
                        }).toList(),
                      );
                    }
                    return Text("load");
                  }),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
