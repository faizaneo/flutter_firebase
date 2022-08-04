import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

List catsdocs = [];
List featuredCatsdocs = [];

late Stream<QuerySnapshot> catsStream;
late Stream<QuerySnapshot> featuredCatsStream;

allCatsMap(snapshot) {
  catsdocs = [];
  snapshot.data!.docs.map((DocumentSnapshot document) {
    Map a = document.data() as Map<String, dynamic>;
    catsdocs.add(a);
    a['id'] = document.id;
  }).toList();
}

featuredCatsMap(snapshot) {
  featuredCatsdocs = [];
  snapshot.data!.docs.map((DocumentSnapshot document) {
    Map a = document.data() as Map<String, dynamic>;
    featuredCatsdocs.add(a);
    a['id'] = document.id;
  }).toList();
}
