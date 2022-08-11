// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:cat_app/apiclient/firebase/firestore_cats.dart';
import 'package:cat_app/model/cat_model.dart';
import 'package:cat_app/screens/cats/cats_preloader.dart';
import 'package:cat_app/services/firebase_service/firebase_service.dart';
import 'package:cat_app/services/internet_checker_service/internet_checker_service.dart';
import 'package:cat_app/services/ui_refresh_service.dart';
import 'package:cat_app/shared/bottom_navigation/bottom_navigation_bar.dart';
import 'package:cat_app/shared/consts/consts.dart';
import 'package:cat_app/widgets/add_remove_button.dart';
import 'package:cat_app/widgets/cat_list_tile.dart';
import 'package:flutter/material.dart';

class Cats extends StatefulWidget {
  Cats({
    Key? key,
  }) : super(key: key);
  @override
  State<Cats> createState() => _CatsState();
}

Future<List<Cat>>? catsList;
List<Cat> retrievedCatsList = [];

class _CatsState extends State<Cats> {
  FirebaseService service = FirebaseService();

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    catsList = service.retrieveCats();
    retrievedCatsList = await service.retrieveCats();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ScrollController controller = ScrollController();
    return FutureBuilder(
        future: catsList,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CatsPreLoader();
          }

          List<Cat> featuredCatsDocs = [];
          featuredCatsMap(featuredCatsDocs, retrievedCatsList);
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
                        ListView.builder(
                            shrinkWrap: true,
                            controller: controller,
                            itemCount: featuredCatsDocs.length,
                            itemBuilder: ((context, index) {
                              return CatListTile(
                                name: featuredCatsDocs[index].name,
                                description: featuredCatsDocs[index].description,
                                addRemoveButton:
                                    AddRemoveButton(index: index, catsDocuments: featuredCatsDocs, setState: setState),
                              );
                            })),
                      ] else
                        Text(
                          'Sorry, we have some problems loading featured cats 😿',
                          style: errorTextStyle,
                        ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text('All cats', style: headlineTextStyle),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          controller: controller,
                          itemCount: retrievedCatsList.length,
                          itemBuilder: ((context, index) {
                            return CatListTile(
                              name: retrievedCatsList[index].name,
                              description: retrievedCatsList[index].description,
                              addRemoveButton:
                                  AddRemoveButton(index: index, catsDocuments: retrievedCatsList, setState: setState),
                            );
                          }))
                    ]),
                  ),
                ),
              ),
              bottomSheet: BottomNavigation(
                currentIndex: 0,
              ));
        });
  }
}
