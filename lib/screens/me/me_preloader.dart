// ignore_for_file: prefer_const_constructors

import 'package:cat_app/shared/bottom_navigation/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MePreLoader extends StatelessWidget {
  const MePreLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 50),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xffE0E0E0), Color(0xffFFFFFF)]),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xffE0E0E0))),
                height: height / 7.3,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text('My cats', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),
              ),
              for (int i = 0; i <= 1; i++) ...[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xffE0E0E0), Color(0xffFFFFFF)]),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Color(0xffE0E0E0))),
                  height: height / 7.3,
                ),
              ]
            ]),
          ),
        ),
        bottomSheet: BottomNavigation(
          currentIndex: 0,
        ));
  }
}
