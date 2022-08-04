import 'package:flutter/material.dart';

buttonDecorator(customGradient) {
  return BoxDecoration(
      gradient: customGradient, borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)));
}
