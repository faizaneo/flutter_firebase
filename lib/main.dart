// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cat_app/screens/cats/cats.dart';
import 'package:cat_app/services/internet_checker_service/global_context_service.dart';
import 'package:cat_app/services/internet_checker_service/internet_checker_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await internetConnectionChecker(InternetConnectionChecker());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Snapshot has error');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              navigatorKey: NavigationService.navigatorKey,
              title: 'Cat App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,
              home: Cats(),
            );
          }

          return CircularProgressIndicator();
        });
  }
}
