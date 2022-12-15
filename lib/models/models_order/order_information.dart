import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sfuverce_app/constants/constants.dart';

class OrderInformation {
  String email;
  //String name;
  String order_code;
  DateTime order_date;
  String order_by_state;
  String order_by_address;
  String order_by_city;
  String order_by_phone;
  String shipping_method;
  String payment_method;
  double sum_price;

  OrderInformation({
    this.email,
    this.order_code,
    this.order_date,
    this.order_by_state,
    this.order_by_address,
    this.order_by_city,
    this.order_by_phone,
    this.payment_method,
    this.shipping_method,
    this.sum_price,
  });

  factory OrderInformation.fromJson(Map<String, dynamic> data) {
    String email = data['email'];
    String orderCode = data['order_code'];
    DateTime orderDate = data['order_date'].toDate();
    String orderByState = data['order_by_state'];
    String orderByAddress = data['order_by_address'];
    String orderByCity = data['order_by_city'];
    String orderByPhone = data['order_by_phone'];
    String shippingMethod = data['shipping_method'];
    String paymentMethod = data['payment_method'];
    double sumPrice = data['sum_price'];
    return OrderInformation(
      email: email,
      //String name;
      order_code: orderCode,
      order_date: orderDate,
      order_by_state: orderByState,
      order_by_address: orderByAddress,
      order_by_city: orderByCity,
      order_by_phone: orderByPhone,
      shipping_method: shippingMethod,
      payment_method: paymentMethod,
      sum_price: sumPrice,
    );
  }

  OrderInformation template() {
    return OrderInformation(
      email: "*******@gmail.com",
      order_code: "********",
      order_date: Timestamp.now().toDate(),
      order_by_state: "*******",
      order_by_address: "Address",
      order_by_city: "City",
      order_by_phone: "(+--)xxxx__",
      shipping_method: "Delivery Labavie",
      payment_method: "Pay",
      sum_price: 0,
    );
  }
}
