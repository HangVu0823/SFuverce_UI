import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sfuverce_app/consts/consts.dart';
import 'package:sfuverce_app/consts/lists.dart';
import 'package:sfuverce_app/screens/cart/cart_controller.dart';
import '../../widgets/widget_common/our_button.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 50,
        child: ourButton(
          onPress: () async {
            controller.placeMyOder(
                orderPaymentMethod:
                    paymentMethods[controller.paymentIndex.value]);
            // await controller.clearCart();

            //VxToast.show(context, msg: "Order placed successfully");
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            // Navigator.push(context,
            //     CupertinoPageRoute(builder: (context) => OrderScreen()));
          },
          color: redColor,
          textColor: whiteColor,
          title: "Place my order",
        ),
      ),
      appBar: AppBar(
        title: "Choose Payment Method"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
              children: List.generate(paymentMethodsImg.length, (index) {
            return GestureDetector(
              onTap: () {
                controller.changePaymentIndex(index);
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: controller.paymentIndex.value == index
                            ? redColor
                            : Colors.transparent,
                        width: 5)),
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(
                      paymentMethodsImg[index],
                      width: double.infinity,
                      height: 120,
                      colorBlendMode: controller.paymentIndex.value == index
                          ? BlendMode.darken
                          : BlendMode.color,
                      color: controller.paymentIndex.value == index
                          ? Colors.black.withOpacity(0.3)
                          : Colors.transparent,
                      fit: BoxFit.cover,
                    ),
                    controller.paymentIndex.value == index
                        ? Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                                activeColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                value: true,
                                onChanged: (value) {}),
                          )
                        : Container(),
                    Positioned(
                        bottom: 10,
                        right: 10,
                        child: paymentMethods[index]
                            .text
                            .white
                            .fontFamily(semibold)
                            .size(15)
                            .make()),
                  ],
                ),
              ),
            );
          })),
        ),
      ),
    );
  }
}
