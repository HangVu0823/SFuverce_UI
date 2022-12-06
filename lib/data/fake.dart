import 'package:flutter/material.dart';
import 'package:sfuverce_app/models/models_home/category.dart';
import 'package:sfuverce_app/models/item.dart';
import 'package:sfuverce_app/models/models_home/promotion.dart';
import 'package:sfuverce_app/models/models_order/track_order.dart';

class Fake {
  static int numberOfItemsInCart = 1;

  static List<Category> categories = [
    Category('assets/icons/chest.svg', 'Living Room'),
    Category('assets/icons/bathtub.svg', 'Bathroom'),
    Category('assets/icons/desk.svg', 'Workspace'),
    Category('assets/icons/bed2.svg', 'Bedroom'),
    Category('assets/icons/kitchen.svg', 'Kitchen'),
  ];

  static List<Promotion> promotions = [
    Promotion(
      backgroundImagePath: 'assets/images/splash1.png',
      reverseGradient: false,
      title: 'All Item Furniture\nDiscount Up to',
      subtitle: '50%',
      tag: '30 April 2019',
      imagePath: 'assets/images/furniture/furniture1.png',
    ),
    Promotion(
      backgroundImagePath: 'assets/images/splash2.png',
      reverseGradient: true,
      title: 'Get voucher gift',
      subtitle: '\$50.00',
      caption: '*for new member\'s\nof Furniture Shop',
    )
  ];

  static List<String> trending = [
    'assets/images/furniture/jacalyn-beales-435629-unsplash.png',
    'assets/images/furniture/sven-brandsma-1379481-unsplash.png',
  ];

  static List<String> featured = [
    'assets/images/furniture/pexels-eric-montanah-1350789.jpg',
    'assets/images/furniture/pexels-patryk-kamenczak-775219.jpg',
    'assets/images/furniture/pexels-pixabay-276534.jpg',
    'assets/images/furniture/pexels-steve-johnson-923192.jpg'
  ];

  static List<Item> furniture;

  // static List<Item> furniture = [
  //   Item(
  //     name: 'Chair Dacey li - Black',
  //     imagePath: 'assets/images/furniture/items/dacey.png',
  //     originalPrice: 80,
  //     rating: 4.5,
  //     discountPercent: 30,
  //     color: 'White',
  //     description:
  //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  //     height: 32,
  //     weight: 38,
  //     //backgorundColor: const Color.fromARGB(255, 255, 255, 255),
  //   ),
  //   Item(
  //     name: 'Elly Sofa Patchwork',
  //     imagePath: 'assets/images/furniture/items/elly.png',
  //     originalPrice: 140,
  //     rating: 4.4,
  //     discountPercent: 30,
  //     color: 'White',
  //     description:
  //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  //     height: 32,
  //     weight: 38,
  //     //backgorundColor: Color.fromARGB(255, 255, 255, 255),
  //   ),
  //   Item(
  //     name: 'Dobson Table - White',
  //     imagePath: 'assets/images/furniture/items/table 2.png',
  //     originalPrice: 160,
  //     rating: 4.3,
  //     discountPercent: 25,
  //     color: 'White',
  //     description:
  //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  //     height: 32,
  //     weight: 38,
  //     //backgorundColor: Color.fromARGB(255, 255, 255, 255),
  //   ),
  //   Item(
  //     name: 'Nagano Table - Brown',
  //     imagePath: 'assets/images/furniture/items/ezgif_com-crop.png',
  //     originalPrice: 140,
  //     rating: 4.3,
  //     discountPercent: 20,
  //     color: 'White',
  //     description:
  //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  //     height: 32,
  //     weight: 38,
  //     //backgorundColor: Color.fromARGB(255, 255, 255, 255),
  //   ),
  //   Item(
  //     name: 'Chair Dacey li - White',
  //     imagePath: 'assets\images\furniture\items\CHair 2.png',
  //     originalPrice: 80,
  //     rating: 4.3,
  //     discountPercent: 20,
  //     color: 'White',
  //     description:
  //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  //     height: 32,
  //     weight: 38,
  //     //backgorundColor: Color.fromARGB(255, 255, 255, 255),
  //   ),
  //   Item(
  //     name: 'Chair Dacey li - Feather Grey',
  //     imagePath: 'assets/images/furniture/items/chair3.png',
  //     originalPrice: 80,
  //     rating: 4.0,
  //     discountPercent: 20,
  //     color: 'White',
  //     description:
  //         'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
  //     height: 32,
  //     weight: 38,
  //     //backgorundColor: Color.fromARGB(255, 255, 255, 255),
  //   ),
  // ];

  static List<TrackOrderModal> trackOrderList = [
    TrackOrderModal(
      icon: Icons.card_travel,
      title: "Ready to Pickup",
      subtitle: "Order from E-commerce",
      time: "08:00",
    ),
    TrackOrderModal(
      icon: Icons.person,
      title: "Order Processed",
      subtitle: "We are preparing your order",
      time: "09:50",
    ),
    TrackOrderModal(
      icon: Icons.payment,
      title: "Payment Confirmed",
      subtitle: "Awaiting Confirmed",
      time: "11:00",
    ),
    TrackOrderModal(
      icon: Icons.receipt,
      title: "Order Placed",
      subtitle: "We have received your order",
      time: "02:10",
    ),
  ];

  // static List<ReviewModal> review = [
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "John Travolta",
  //     rating: 3.5,
  //     date: "01 Jan 2021",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Scarlett Johansson",
  //     rating: 2.5,
  //     date: "21 Feb 2021",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Jennifer Lawrence",
  //     rating: 4.5,
  //     date: "17 Mar 2021",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Michael Jordan",
  //     rating: 1.5,
  //     date: "12 Apr 2021",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Nicole Kidman",
  //     rating: 2.0,
  //     date: "28 May 2021",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "James Franco",
  //     rating: 4.0,
  //     date: "14 Nov 2020",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Margot Robbie",
  //     rating: 1.0,
  //     date: "14 Nov 2020",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Nicolas Cage",
  //     rating: 3.0,
  //     date: "14 Nov 2020",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Emma Stone",
  //     rating: 5.0,
  //     date: "14 Nov 2020",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: 'assets/images/user/user_avatar/user1.jpg',
  //     name: "Johnny Depp",
  //     rating: 3.5,
  //     date: "14 Nov 2020",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Natalie Portman",
  //     rating: 3.5,
  //     date: "14 Nov 2020",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Anne Hathaway",
  //     rating: 3.5,
  //     date: "14 Nov 2020",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  //   ReviewModal(
  //     image: "assets/images/avatar.png",
  //     name: "Charlize Theron",
  //     rating: 3.5,
  //     date: "14 Nov 2020",
  //     comments:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
  //   ),
  // ];
}
