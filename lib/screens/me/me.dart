// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cat_app/model/cat_model.dart';
import 'package:cat_app/services/internet_checker_service/internet_checker_service.dart';
import 'package:cat_app/shared/bottom_navigation/bottom_navigation_bar.dart';
import 'package:cat_app/shared/consts/consts.dart';
import 'package:cat_app/widgets/add_remove_button.dart';
import 'package:cat_app/widgets/cat_list_tile.dart';
import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  const Me({Key? key}) : super(key: key);

  @override
  State<Me> createState() => _MeState();
}

//List fav cats
List<Cat> favCats = [];

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final ScrollController controller = ScrollController();
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 50),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (internetCheck == true) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height / 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Catholder-22',
                            style: headlineTextStyle,
                          ),
                          Row(
                            children: [
                              Text(
                                'Age: ',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '21',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/pngs/white-cat.png',
                      height: height / 8,
                      width: height / 8,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ] else ...[
                Text(
                  'Sorry, we have some problems loading your profile 😿',
                  style: errorTextStyle,
                ),
              ],
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text('My cats', style: headlineTextStyle),
              ),
              if (favCats.isNotEmpty) ...[
                ListView.builder(
                  shrinkWrap: true,
                  controller: controller,
                  itemCount: favCats.length,
                  itemBuilder: (context, index) {
                    return CatListTile(
                      name: favCats[index].name,
                      description: favCats[index].description,
                      addRemoveButton: AddRemoveButton(
                        index: index,
                        catsDocuments: favCats,
                        setState: setState,
                      ),
                    );
                  },
                )
              ] else ...[
                Container(
                  height: height / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'You do not have any favourite cat.',
                          style: errorTextStyle,
                        ),
                      ),
                    ],
                  ),
                )
              ]
            ]),
          ),
        ),
        bottomSheet: BottomNavigation(
          currentIndex: 1,
        ));
  }
}
