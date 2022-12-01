import 'package:flutter/material.dart';
import 'package:sfuverce_app/data/fake.dart';
import 'package:sfuverce_app/screens/home_screens/category/widgets_category/category_controler.dart';
import 'package:sfuverce_app/screens/home_screens/category/widgets_category/furniture_grid_item.dart';
import 'package:sfuverce_app/screens/home_screens/category/widgets_category/header_sliver.dart';
import 'package:sfuverce_app/services/database_service.dart';
import 'package:sfuverce_app/widgets/app_bottom_navigation.dart';

import '../../../models/item.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Future<List<Item>> loadData() async {
    print("start load");
    List<Item> result = [];
    List<CategoriesFirebase> categories = [];
    categories = await DatabaseService().getCategoriesFromFirestore();

    for (int i = 0; i < categories.length; i++) {
      if (categories[i].title == CategoryController.onSelected) {
        result = await DatabaseService().getItemWithCategory(categories[i].id);
        return result;
      }
    }
    print("end load");
    return result;
  }

  Widget buildItem(List<Item> furniture) {
    return FutureBuilder(
      future: loadData(),
      builder: (context, AsyncSnapshot<List<Item>> snapshot) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: HeaderSliver(
                    minExtent: 120,
                    maxExtent: 120,
                  ),
                ),
                SliverGrid.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: (snapshot.data ?? []).asMap().entries.map((f) {
                    return FurnitureGridItem(
                        item: f.value,
                        margin: EdgeInsets.only(
                          left: f.key.isEven ? 16 : 0,
                          right: f.key.isOdd ? 16 : 0,
                        ));
                  }).toList(),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
        builder: (context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasError) {
            print("Loi cmnr ${snapshot.error}");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return buildItem(snapshot.data);
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
