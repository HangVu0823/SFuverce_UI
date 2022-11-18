import 'package:flutter/material.dart';
import 'package:sfuverce_app/constants/colors.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: kPrimaryColor),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
