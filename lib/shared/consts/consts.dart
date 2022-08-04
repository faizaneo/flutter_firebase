import 'package:flutter/material.dart';

const headlineTextStyle = TextStyle(fontSize: 34, fontWeight: FontWeight.w700);

const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);

const subtitleTextStyle = TextStyle(fontSize: 14, color: Colors.grey);

const errorTextStyle = TextStyle(fontWeight: FontWeight.w400, color: Color(0xff666666), fontSize: 16);

const addButtonGradient =
    LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0xffFFAB91), Color(0xffFF6F43)]);

final removeButtonGradient = LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
  Color(0xffE0E0E0).withOpacity(0.1),
  Color(0xffE0E0E0),
]);

const shimmerGradient = LinearGradient(colors: [Color(0xffE0E0E0), Color(0xffFFFFFF)]);

const bottomNavGradient =
    LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0xffFFFFFF), Color(0xffFBE9E7)]);
