import 'package:cloud_firestore/cloud_firestore.dart';

class Cat {
  final String id;
  final String name;
  final String description;
  final bool featured;

  Cat({required this.id, required this.name, required this.description, required this.featured});

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Description': description,
      'featured': featured,
    };
  }

  Cat.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> doc,
  )   : id = doc.id,
        name = doc.data()!["Name"] ?? '',
        description = doc.data()!["Description"] ?? '',
        featured = doc.data()!["featured"] ?? false;
}
