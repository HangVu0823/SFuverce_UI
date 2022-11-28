import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sfuverce_app/screens/home_screens/category/widgets_category/color_list.dart';

class OptionModal_AddCart extends StatefulWidget {
  _OptionModalBottomSheetState createState() => _OptionModalBottomSheetState();
}

class _OptionModalBottomSheetState extends State<OptionModal_AddCart> {
  int quality = 0;
  void _incrementCount() {
    setState(() {
      quality++;
    });
  }

  void _decrementCount() {
    if (quality < 1) return;
    setState(() {
      quality--;
    });
  }

  void close(context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(28.0),
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    child: Icon(Icons.close),
                    onTap: () {
                      close(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Color',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ColorList(
              [
                Colors.white,
                Colors.black87,
                Colors.blue,
                Colors.cyan,
                Colors.red,
              ],
              onSelect: (color) => print(color),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Amount',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      alignment: Alignment.bottomRight,
                      child: Center(
                        child: FloatingActionButton(
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                            size: 12.0,
                          ),
                          onPressed: _incrementCount,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "${quality}",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      child: Center(
                        child: FloatingActionButton(
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,
                            size: 12.0,
                          ),
                          onPressed: _decrementCount,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                child: Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 16))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
