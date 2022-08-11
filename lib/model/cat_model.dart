import 'package:cloud_firestore/cloud_firestore.dart';

class Cat {
  final String id;
  final String name;
  final String description;
  final bool featured;
  final String imagePath;
  bool isFavourite;

  Cat(
      {required this.id,
      required this.name,
      required this.description,
      required this.featured,
      required this.imagePath,
      required this.isFavourite});

  Map<String, dynamic> toMap() {
    return {'Name': name, 'Description': description, 'featured': featured, 'Image': imagePath, 'Favourite': isFavourite};
  }

  Cat.fromDocumentSnapshot(
    DocumentSnapshot<Map<String, dynamic>> doc,
  )   : id = doc.id,
        name = doc.data()!["Name"] ?? '',
        description = doc.data()!["Description"] ?? '',
        featured = doc.data()!["Featured"] ?? false,
        imagePath = doc.data()!["Image"] ?? '',
        isFavourite = doc.data()!['Favourite'];
}
