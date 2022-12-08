import 'package:flutter/material.dart';
import 'package:sfuverce_app/data/fake.dart';
import 'package:sfuverce_app/screens/home_screens/category/category_screen.dart';
import 'package:sfuverce_app/screens/home_screens/category/widgets_category/category_controler.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/category_card.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/header.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/image_card.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/promo_card.dart';
import 'package:sfuverce_app/screens/home_screens/home/widgets_home/section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  onCategorySelected(BuildContext context, category, String content) {
    CategoryController.onSelected = content;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    onCategorySelected(
                      context,
                      c,
                      c.title,
                    );
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
    );
  }
}
