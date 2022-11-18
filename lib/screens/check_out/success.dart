import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/constants/constants.dart';
import 'package:sfuverce_app/screens/components/emptySection.dart';
import 'package:sfuverce_app/screens/components/subTitle.dart';
import 'package:sfuverce_app/screens/delivery/trackorder.dart';

class Success extends StatefulWidget {
  Success({Key key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: success,
            emptyMsg: 'Successful !!',
          ),
          SubTitle(
            subTitleText: 'Your payment was done successfully',
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TrackOrder(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
