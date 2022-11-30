import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:sfuverce_app/data/fake.dart';
import 'package:sfuverce_app/models/models_review/ReviewModal.dart';
import 'package:sfuverce_app/screens/cart/details_screen.dart';
import 'package:sfuverce_app/screens/home_screens/category/category_screen.dart';
import 'package:sfuverce_app/screens/reviews/reviewsUI.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class Reviews extends StatelessWidget {
  Reviews({Key key, this.data}) : super(key: key);
  bool isMore = false;
  List<double> rating = [0.1, 0.3, 0.5, 0.7, 0.9];
  final List<ReviewModal> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            }),
        title: Text(
          'Reviews',
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
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "4.5", style: TextStyle(fontSize: 48.0)),
                          TextSpan(
                              text: "/5",
                              style: TextStyle(
                                fontSize: 24.0,
                                color: kLightColor,
                              )),
                        ],
                      ),
                    ),
                    SmoothStarRating(
                      starCount: 5,
                      rating: 4.5,
                      size: 28.0,
                      color: Colors.yellow,
                      borderColor: Colors.yellow,
                    ),
                    Text(
                      "${data.length} Review",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: kLightColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 200.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text("${index + 1}",
                              style: TextStyle(fontSize: 18.0)),
                          SizedBox(height: 4.0),
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(height: 8.0),
                          LinearPercentIndicator(
                            lineHeight: 6.0,
                            //linearStrokeCap: LinearStrokeCap.roundAll,
                            width: MediaQuery.of(context).size.width / 2.8,
                            animation: true,
                            animationDuration: 2500,
                            percent: rating[index],
                            progressColor: Colors.yellow,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                bottom: 8.0,
                top: 8.0,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ReviewsUI(
                  image: data[index].image,
                  name: data[index].name,
                  date: data[index].date,
                  comments: data[index].comments,
                  rating: data[index].rating,
                  onPressed: () => print("More Action $index"),
                  // onTap: () => setState(() {
                  //   isMore = !isMore;
                  // }),
                  isLess: isMore,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2.0,
                  color: kDarkColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
