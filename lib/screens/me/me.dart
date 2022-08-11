// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cat_app/apiclient/firebase/firestore_cats.dart';
import 'package:cat_app/model/cat_model.dart';
import 'package:cat_app/services/firebase_service/firebase_service.dart';
import 'package:cat_app/services/internet_checker_service/internet_checker_service.dart';
import 'package:cat_app/shared/bottom_navigation/bottom_navigation_bar.dart';
import 'package:cat_app/shared/consts/consts.dart';
import 'package:cat_app/widgets/add_remove_button.dart';
import 'package:cat_app/widgets/cat_list_tile.dart';
import 'package:cat_app/widgets/shimmer_list_tile.dart';
import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  const Me({Key? key}) : super(key: key);

  @override
  State<Me> createState() => _MeState();
}

//List fav cats
// List<Cat> favCats = [];
// favCatsFilter(favCats, c);
Future<List<Cat>>? favCatsList;
List<Cat> retrievedfavCatsList = [];

class _MeState extends State<Me> {
  FirebaseService service = FirebaseService();

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future<void> _initRetrieval() async {
    favCatsList = service.retrieveCats();
    retrievedfavCatsList = await service.retrieveCats();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final ScrollController controller = ScrollController();
    return FutureBuilder(
        future: favCatsList,
        builder: (BuildContext context, snapshot) {
          double height = MediaQuery.of(context).size.height;
          List<Cat> favCatsDocs = [];
          favCatsFilter(favCatsDocs, retrievedfavCatsList);

          return Scaffold(
              body: Container(
                height: height - (height / 8.55),
                padding: EdgeInsets.only(left: 24, right: 24, top: 50),
                child: SingleChildScrollView(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('My cats', style: headlineTextStyle),
                          favCatsDocs.isEmpty
                              ? Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text('You don\'t have any favourite cats.',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)))
                              : Container()
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      controller: controller,
                      itemCount: favCatsDocs.isEmpty ? 3 : favCatsDocs.length,
                      itemBuilder: (context, index) {
                        return favCatsDocs.isEmpty
                            ? ShimmerListTile()
                            : CatListTile(
                                name: favCatsDocs[index].name,
                                description: favCatsDocs[index].description,
                                imagePath: favCatsDocs[index].imagePath,
                                addRemoveButton: AddRemoveButton(
                                  selectedCat: favCatsDocs[index],
                                  setState: setState,
                                ),
                              );
                      },
                    )
                  ]),
                ),
              ),
              bottomSheet: BottomNavigation(
                currentIndex: 1,
              ));
        });
  }
}
