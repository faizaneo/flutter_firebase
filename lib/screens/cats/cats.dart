// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cat_app/apiclient/firebase/firestore_cats.dart';
import 'package:cat_app/screens/cats/cats_preloader.dart';
import 'package:cat_app/screens/me/me.dart';
import 'package:cat_app/services/internet_checker_service/internet_checker_service.dart';
import 'package:cat_app/services/ui_refresh_service.dart';
import 'package:cat_app/shared/bottom_navigation/bottom_navigation_bar.dart';
import 'package:cat_app/shared/consts/consts.dart';
import 'package:cat_app/widgets/add_remove_button.dart';
import 'package:cat_app/widgets/custom_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Cats extends StatefulWidget {
  Cats({
    Key? key,
  }) : super(key: key);

  @override
  State<Cats> createState() => _CatsState();
}

class _CatsState extends State<Cats> {
  @override
  void initState() {
    super.initState();
    catsStream = FirebaseFirestore.instance.collection('cats').snapshots();
    featuredCatsStream = FirebaseFirestore.instance.collection('cats').where('featured', isEqualTo: true).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return StreamBuilder(
        stream: featuredCatsStream,
        builder: (BuildContext context, featuredSnapShot) {
          return StreamBuilder(
              stream: catsStream,
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CatsPreLoader();
                }
                //
                allCatsMap(snapshot);
                featuredCatsMap(featuredSnapShot);
                //

                return Scaffold(
                    body: RefreshIndicator(
                      onRefresh: () {
                        return refreshPage(setState);
                      },
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(left: 24, right: 24, top: 50),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(
                              'Featured',
                              style: headlineTextStyle,
                            ),
                            if (internetCheck == true) ...[
                              for (int i = 0; i < featuredCatsdocs.length; i++) ...[
                                CustomListTile(
                                  name: featuredCatsdocs[i]['Name'],
                                  description: featuredCatsdocs[i]['description'],
                                  addRemoveButton: AddRemoveButton(index: i, catsDocuments: featuredCatsdocs, state: setState),
                                )
                              ],
                            ] else
                              Text(
                                'Sorry, we have some problems loading featured cats 😿',
                                style: errorTextStyle,
                              ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Text('All cats', style: headlineTextStyle),
                            ),
                            for (int i = 0; i < catsdocs.length; i++) ...[
                              CustomListTile(
                                  name: catsdocs[i]['Name'],
                                  description: catsdocs[i]['description'],
                                  addRemoveButton: AddRemoveButton(index: i, catsDocuments: catsdocs, state: setState))
                            ]
                          ]),
                        ),
                      ),
                    ),
                    bottomNavigationBar: BottomNavigation(
                      currentIndex: 0,
                    ));
              });
        });
  }
}
