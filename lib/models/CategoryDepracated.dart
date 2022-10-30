import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase_services.dart';

class CategoryDeprecated {
  CategoryDeprecated({required this.catName, required this.image});

  CategoryDeprecated.fromJson(Map<String, Object?> json)
      : this(
    catName: json['catName']! as String,
    image: json['image']! as String,
  );

  final String? catName;
  final String? image;

  Map<String, Object?> toJson() {
    return {
      'catName': catName,
      'image': image,
    };
  }
}
FirebaseService _service = FirebaseService();
final categoriesCollection = _service.categories.where('active',isEqualTo: true).withConverter<CategoryDeprecated>(
  fromFirestore: (snapshot, _) => CategoryDeprecated.fromJson(snapshot.data()!),
  toFirestore: (categories, _) => categories.toJson(),
);