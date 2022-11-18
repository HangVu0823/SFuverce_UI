import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/data/fake.dart';
import 'package:im_stepper/stepper.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';

class TrackOrder extends StatefulWidget {
  TrackOrder({Key key}) : super(key: key);

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            iconSize: 30.0,
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageNavigation()));
            }),
        title: Text(
          'Track My Order',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Wed, 12 September",
              style: TextStyle(fontSize: 18.0, color: kLightColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Oder ID: 5136",
              style: TextStyle(
                fontSize: 18.0,
                color: kLightColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
            child: Text(
              "Oders",
              style: TextStyle(
                fontSize: 22.0,
                color: kLightColor,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 6,
                child: IconStepper(
                  direction: Axis.vertical,
                  enableNextPreviousButtons: false,
                  stepColor: Colors.green,
                  activeStepBorderColor: kWhiteColor,
                  activeStepBorderWidth: 0.0,
                  activeStepBorderPadding: 0.0,
                  lineColor: Colors.green,
                  lineLength: 70.0,
                  lineDotRadius: 2.0,
                  stepRadius: 16.0,
                  icons: [
                    Icon(
                      Icons.radio_button_checked,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.check,
                      color: kWhiteColor,
                    ),
                    Icon(
                      Icons.check,
                      color: kWhiteColor,
                    ),
                    Icon(
                      Icons.check,
                      color: kWhiteColor,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: Fake.trackOrderList.length,
                  itemBuilder: ((context, index) {
                    return Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: ListTile(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 16.0),
                            leading: Icon(
                              Fake.trackOrderList[index].icon,
                              size: 48.0,
                              color: primaryColor,
                            ),
                            title: Text(
                              Fake.trackOrderList[index].title,
                              style: TextStyle(fontSize: 18.0),
                            ),
                            subtitle: Text(
                              Fake.trackOrderList[index].subtitle,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                        Text(
                          Fake.trackOrderList[index].time,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            padding: EdgeInsets.only(left: 24.0, top: 24.0, bottom: 16.0),
            decoration: BoxDecoration(
              color: primaryColor,
              border: Border.all(
                width: 0.5,
                color: kLightColor,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Icon(Icons.home, size: 64.0, color: kWhiteColor),
                SizedBox(width: 32.0),
                Column(
                  children: [
                    Text(
                      "Delivery Address",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Text(
                      "Home, work & Other Address",
                      style: TextStyle(fontSize: 17.0),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Text(
                        "House No: 1234, 2nd Floor Sector 18, HCM City",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
