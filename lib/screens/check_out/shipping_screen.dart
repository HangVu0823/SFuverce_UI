import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfuverce_app/constants/constants.dart';
import 'package:sfuverce_app/screens/cart/cart_controller.dart';
import 'package:sfuverce_app/screens/check_out/payment_method.dart';

import '../../widgets/widget_common/custom_textfiled.dart';
import '../../widgets/widget_common/our_button.dart';
import '../authentication_screen/signup_screen.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Shipping Information"),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ourButton(
          onPress: () {
            if (controller.addressController.text.length > 2) {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => PaymentMethod()));
            } else {
              VxToast.show(context, msg: "Please fill the form");
            }
          },
          color: redColor,
          textColor: whiteColor,
          title: "Continue",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(children: [
          customTextField(
            hint: "Address",
            isPass: false,
            title: "Address",
            controller: controller.addressController,
          ),
          customTextField(
              hint: "City",
              isPass: false,
              title: "City",
              controller: controller.cityController),
          customTextField(
              hint: "State",
              isPass: false,
              title: "State",
              controller: controller.stateController),
          customTextField(
              hint: "Postal Code",
              isPass: false,
              title: "Postal Code",
              controller: controller.postalController),
          customTextField(
              hint: "Phone",
              isPass: false,
              title: "Phone",
              controller: controller.phoneController),
        ]),
      ),
    );
  }
}
