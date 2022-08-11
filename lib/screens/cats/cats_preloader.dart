// ignore_for_file: prefer_const_constructors

import 'package:cat_app/screens/me/me.dart';
import 'package:cat_app/shared/bottom_navigation/bottom_navigation_bar.dart';
import 'package:cat_app/shared/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CatsPreLoader extends StatelessWidget {
  const CatsPreLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 50),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Featured',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
              for (int i = 0; i <= 1; i++) ...[
                Shimmer.fromColors(
                  baseColor: Color(0xffE0E0E0),
                  highlightColor: Colors.white,
                  period: Duration(seconds: 5),
                  enabled: true,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        gradient: shimmerGradient,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xffE0E0E0))),
                    height: height / 7.3,
                  ),
                ),
              ],
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text('All cats', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),
              ),
              for (int i = 0; i <= 1; i++) ...[
                Shimmer.fromColors(
                  baseColor: Color(0xffE0E0E0),
                  highlightColor: Colors.white,
                  enabled: true,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        gradient: shimmerGradient,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xffE0E0E0))),
                    height: height / 7.3,
                  ),
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
