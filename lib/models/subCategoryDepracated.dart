import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase_services.dart';

class SubCategoryDeprecated {
  SubCategoryDeprecated( {  required this.image ,   required this.mainCategory, required this.subCatName});

  SubCategoryDeprecated.fromJson(Map<String, Object?> json)
      : this(
    image: json['image']! as String,
    mainCategory: json['mainCategory']! as String,

    subCatName: json['subCatName'] as String,


  );

  final String? image;
  final String? mainCategory;
  final String subCatName;


  Map<String, Object?> toJson() {
    return {
      'image': image,
      'mainCategory': mainCategory,
      'subCatName': subCatName,


    };
  }
}
FirebaseService _service = FirebaseService();
subCategoriesCollection( {subCatSelected}) {
  return _service.subCategories.where('active',isEqualTo: true).where('mainCategory',isEqualTo:subCatSelected).withConverter<SubCategoryDeprecated>(
    fromFirestore: (snapshot, _) => SubCategoryDeprecated.fromJson(snapshot.data()!),
    toFirestore: (categories, _) => categories.toJson(),
  );
}