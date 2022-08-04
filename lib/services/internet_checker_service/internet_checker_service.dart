// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:cat_app/services/internet_checker_service/global_context_service.dart';
import 'package:cat_app/shared/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

bool? internetCheck = true;

Future<void> internetConnectionChecker(InternetConnectionChecker internetConnectionChecker) async {
  InternetConnectionChecker().onStatusChange.listen(
    (InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          internetCheck = true;
          showSnackBar(NavigationService.navigatorKey.currentContext, 'Connected to internet', Color(0xff6FCF97));

          break;
        case InternetConnectionStatus.disconnected:
          internetCheck = false;
          showSnackBar(NavigationService.navigatorKey.currentContext, 'No internet connection', Color(0xffEB5757));

          break;
      }
    },
  );
}
