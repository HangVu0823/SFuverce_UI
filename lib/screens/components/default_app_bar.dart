import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final action;
  const DefaultAppBar({
    Key key,
    this.title,
    this.child,
    this.action,
  }) : super(key: key);

  Size get preferredSize => Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: primaryColor)),
      centerTitle: true,
      backgroundColor: kWhiteColor,
      elevation: kRadius,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: primaryColor),
      leading: child,
      actions: action,
    );
  }
}
