import 'package:sfuverce_app/models/parse.dart';

class ReviewModal {
  String firebaseId;
  String image;
  String name;
  String date;
  String comments;
  double rating;

  ReviewModal({
    this.firebaseId,
    this.image,
    this.name,
    this.date,
    this.comments,
    this.rating,
  });

  factory ReviewModal.fromJson(Map<String, dynamic> data, String id) {
    //print("aaaa $id");
    String firebaseId = id;
    String name = data['name'];
    String image = data['image'];
    double rating = Parse.parseDoubleFromJson(data['rating']);
    String date = data['date'];
    String comments = data['comments'];

    return ReviewModal(
      firebaseId: id,
      name: name,
      image: image,
      rating: rating,
      date: date,
      comments: comments,
    );
  }
}
