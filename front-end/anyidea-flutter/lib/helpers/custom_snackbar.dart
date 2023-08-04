import 'package:flutter/material.dart';

import '../constants/pallete.dart';

class CustomSnackBar {
  BuildContext context;
  CustomSnackBar({required this.context});

  show(msg) {
    final snackBar = SnackBar(
      backgroundColor: Pallete.whiteColor,
      content: Center(child: Text(msg)),
      action: SnackBarAction(
        textColor: Colors.red,
        label: 'Hide',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}