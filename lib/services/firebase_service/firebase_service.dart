import 'dart:developer';

import 'package:cat_app/model/cat_model.dart';
import 'package:cat_app/services/internet_checker_service/global_context_service.dart';
import 'package:cat_app/shared/snackbar/snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  Future<List<Cat>> retrieveCats() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection("cats").get().catchError((e) {
      return showSnackBar(NavigationService.navigatorKey.currentContext, e.toString(), Color(0xffEB5757));
    });
    return snapshot.docs
        .map((DocumentSnapshot<Map<String, dynamic>> docSnapshot) => Cat.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  Future<List<Cat>> retrieveFavCats() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection("cats").where('Favourite', isEqualTo: true).get().catchError((e) {
      return showSnackBar(NavigationService.navigatorKey.currentContext, e.toString(), Color(0xffEB5757));
    });
    return snapshot.docs
        .map((DocumentSnapshot<Map<String, dynamic>> docSnapshot) => Cat.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

  void updateCat(Cat catToUpdate, StateSetter setState) async {
    await FirebaseFirestore.instance
        .collection("cats")
        .doc(catToUpdate.id)
        .update(catToUpdate.toMap())
        .then((value) => setState(() {}));
  }
}
