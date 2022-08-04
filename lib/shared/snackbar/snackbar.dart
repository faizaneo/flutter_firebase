import 'package:cat_app/shared/consts/consts.dart';
import 'package:flutter/material.dart';

showSnackBar(BuildContext? context, message, color) {
  var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      dismissDirection: DismissDirection.none,
      margin: EdgeInsets.only(bottom: MediaQuery.of(context!).size.height / 1.35, right: 20, left: 20),
      backgroundColor: color,
      content: Text(
        message,
        style: const TextStyle(fontSize: 15),
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
