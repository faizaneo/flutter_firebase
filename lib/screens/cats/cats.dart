// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:cat_app/apiclient/firebase/firestore_cats.dart';
import 'package:cat_app/model/cat_model.dart';
import 'package:cat_app/services/firebase_service/firebase_service.dart';
import 'package:cat_app/services/internet_checker_service/internet_checker_service.dart';
import 'package:cat_app/services/ui_refresh_service.dart';
import 'package:cat_app/shared/bottom_navigation/bottom_navigation_bar.dart';
import 'package:cat_app/shared/consts/consts.dart';
import 'package:cat_app/widgets/add_remove_button.dart';
import 'package:cat_app/widgets/cat_list_tile.dart';
import 'package:cat_app/widgets/shimmer_list_tile.dart';
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
    final ScrollController controller = ScrollController();
    return FutureBuilder(
        future: catsList,
        builder: (BuildContext context, snapshot) {
          double height = MediaQuery.of(context).size.height;
          List<Cat> featuredCatsDocs = [];
          featuredCatsFilter(featuredCatsDocs, retrievedCatsList);

          return Scaffold(
              body: RefreshIndicator(
                onRefresh: () {
                  return refreshPage(setState);
                },
                child: Container(
                  height: height - (height / 8.55),
                  padding: EdgeInsets.only(left: 24, right: 24, top: 50),
                  child: SingleChildScrollView(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        'Featured',
                        style: headlineTextStyle,
                      ),
                      if (internetCheck == true) ...[
                        ListView.builder(
                            shrinkWrap: true,
                            controller: controller,
                            itemCount: featuredCatsDocs.isEmpty ? 2 : featuredCatsDocs.length,
                            itemBuilder: ((context, index) {
                              return featuredCatsDocs.isEmpty
                                  ? ShimmerListTile()
                                  : CatListTile(
                                      name: featuredCatsDocs[index].name,
                                      description: featuredCatsDocs[index].description,
                                      imagePath: featuredCatsDocs[index].imagePath,
                                      addRemoveButton: AddRemoveButton(selectedCat: featuredCatsDocs[index], setState: setState),
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
                          itemCount: retrievedCatsList.isEmpty ? 5 : retrievedCatsList.length,
                          itemBuilder: ((context, index) {
                            return retrievedCatsList.isEmpty
                                ? ShimmerListTile()
                                : CatListTile(
                                    name: retrievedCatsList[index].name,
                                    description: retrievedCatsList[index].description,
                                    imagePath: retrievedCatsList[index].imagePath,
                                    addRemoveButton: AddRemoveButton(selectedCat: retrievedCatsList[index], setState: setState),
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
