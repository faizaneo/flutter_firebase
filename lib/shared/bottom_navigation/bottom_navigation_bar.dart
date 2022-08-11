// ignore_for_file: prefer_const_constructors

import 'package:cat_app/screens/cats/cats.dart';
import 'package:cat_app/screens/me/me.dart';
import 'package:cat_app/shared/consts/consts.dart';
import 'package:cat_app/widgets/decorators/bottom_navbar_decorator.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  int currentIndex;
  BottomNavigation({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 8,
      decoration: buttonDecorator(bottomNavGradient),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              if (widget.currentIndex == 1) {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => Cats(),
                      transitionDuration: Duration(seconds: 0),
                    ));
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu, size: 30, color: widget.currentIndex == 0 ? Color(0xffFF6F43) : Colors.black),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    'Cats',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: widget.currentIndex == 0 ? Color(0xffFF6F43) : Colors.black),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              if (widget.currentIndex == 0) {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => Me(),
                      transitionDuration: Duration(seconds: 0),
                    ));
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.face,
                  size: 30,
                  color: widget.currentIndex == 1 ? Color(0xffFF6F43) : Colors.black,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    'Me',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: widget.currentIndex == 1 ? Color(0xffFF6F43) : Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
