import 'package:flutter/material.dart';
import 'package:sfuverce_app/data/fake.dart';
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
    result = await DatabaseService().getItemFromFirestore();
    print("end load");
    return result;
  }

  Widget buildItem(List<Item> furniture) {
    return Scaffold(
      // bottomNavigationBar: AppBottomNavigation(),
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
              children: (furniture ?? []).asMap().entries.map((f) {
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
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
        builder: (context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasError) {
            print("Loi cmnr");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return buildItem(snapshot.data);
          }
          return CircularProgressIndicator();
        });
  }
}
