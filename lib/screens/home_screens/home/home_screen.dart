import 'package:flutter/material.dart';
import 'package:sfuverce_app/data/fake.dart';
import 'package:sfuverce_app/screens/home_screens/category/category_screen.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/category_card.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/header.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/image_card.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/promo_card.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/section.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  onCategorySelected(category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Section(
                'Categories',
                Fake.categories.map((c) {
                  return CategoryCard(
                    title: c.title,
                    iconPath: c.iconPath,
                    onTap: () {
                      onCategorySelected(c);
                    },
                  );
                }).toList(),
              ),
              Section(
                'Today\'s Promo',
                Fake.promotions.map((p) {
                  return PromoCard(
                    title: p.title,
                    subtitle: p.subtitle,
                    tag: p.tag,
                    caption: p.caption,
                    imagePath: p.imagePath,
                    backgroundImagePath: p.backgroundImagePath,
                  );
                }).toList(),
              ),
              Section(
                  'Trending Furniture',
                  Fake.trending
                      .map((imagePath) => ImageCard(imagePath))
                      .toList()),
              Section(
                  'Featured Furniture',
                  Fake.featured
                      .map((imagePath) => ImageCard(imagePath))
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
