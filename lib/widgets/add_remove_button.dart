// ignore_for_file: prefer_const_constructors

import 'package:cat_app/screens/cats/cats.dart';
import 'package:cat_app/screens/me/me.dart';
import 'package:cat_app/services/internet_checker_service/global_context_service.dart';
import 'package:cat_app/shared/consts/consts.dart';
import 'package:cat_app/widgets/decorators/button_decorator.dart';
import 'package:flutter/material.dart';

class AddRemoveButton extends StatelessWidget {
  final int index;
  final List catsDocuments;
  final StateSetter setState;
  AddRemoveButton({
    required this.index,
    required this.catsDocuments,
    required this.setState,
  });

  @override
  build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return favCats.any((element) => element.id == catsDocuments[index].id)
        ? InkWell(
            onTap: () {
              catsDocuments == favCats
                  ? setState(() {
                      catsDocuments.remove(catsDocuments[index]);
                    })
                  : setState(() {
                      favCats.remove(favCats.firstWhere((element) => element.id == catsDocuments[index].id));
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
              if (!favCats.any((element) => element.id == catsDocuments[index].id)) {
                setState(() {
                  favCats.add(catsDocuments[index]);
                });
              }
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
