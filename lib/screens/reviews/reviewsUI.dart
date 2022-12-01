import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class ReviewsUI extends StatelessWidget {
  final String image, name, date, comments;
  final double rating;
  final Function onTap, onPressed;
  final bool isLess;
  const ReviewsUI({
    Key key,
    this.image,
    this.name,
    this.date,
    this.comments,
    this.rating,
    this.onTap,
    this.isLess,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(image.toString());
    return Container(
      padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 16.0, right: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(44.0),
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
          SizedBox(height: kLessPadding),
          Row(
            children: [
              SmoothStarRating(
                starCount: 5,
                rating: rating,
                size: 28.0,
                color: Colors.yellow,
                borderColor: Colors.yellow,
              ),
              SizedBox(width: kFixPadding),
              Text(
                date,
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: isLess
                ? Text(
                    comments,
                    // maxLines: 3,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kDarkColor,
                    ),
                  )
                : Text(
                    comments,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kDarkColor,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
