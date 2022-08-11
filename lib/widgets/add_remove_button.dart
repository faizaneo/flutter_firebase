// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cat_app/model/cat_model.dart';
import 'package:cat_app/screens/cats/cats.dart';
import 'package:cat_app/screens/me/me.dart';
import 'package:cat_app/services/firebase_service/firebase_service.dart';
import 'package:cat_app/services/internet_checker_service/global_context_service.dart';
import 'package:cat_app/shared/consts/consts.dart';
import 'package:cat_app/widgets/decorators/button_decorator.dart';
import 'package:flutter/material.dart';

class AddRemoveButton extends StatelessWidget {
  Cat selectedCat;
  final StateSetter setState;
  AddRemoveButton({
    required this.selectedCat,
    required this.setState,
  });

  @override
  build(BuildContext context) {
    bool loader = false;
    FirebaseService service = FirebaseService();
    // print(selectedCat.isFavourite.toString());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return selectedCat.isFavourite
        ? InkWell(
            onTap: () {
              selectedCat.isFavourite = false;

              service.updateCat(selectedCat, setState);
              setState(() {
                loader = true;
              });
            },
            child: Container(
              height: height / 22,
              width: width / 1.9,
              alignment: Alignment.center,
              decoration: buttonDecorator(removeButtonGradient),
              child: Text(
                'Remove',
                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              selectedCat.isFavourite = true;

              service.updateCat(selectedCat, setState);
              setState(() {
                loader = false;
              });
            },
            child: Container(
              height: height / 22,
              width: width / 1.9,
              alignment: Alignment.center,
              decoration: buttonDecorator(addButtonGradient),
              child: Text(
                'Add',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          );
  }
}
