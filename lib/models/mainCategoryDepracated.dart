import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase_services.dart';

class MainCategoryDeprecated {
  MainCategoryDeprecated({required this.category, required this.mainCategory});

  MainCategoryDeprecated.fromJson(Map<String, Object?> json)
      : this(
    category: json['category']! as String,
    mainCategory: json['mainCategory']! as String,
  );

  final String? category;
  final String? mainCategory;

  Map<String, Object?> toJson() {
    return {
      'category': category,
      'mainCategory': mainCategory,
    };
  }
}
FirebaseService _service = FirebaseService();
mainCategoriesCollection (selectedCat){
  return _service.mainCategories.where('approved',isEqualTo: true).where('category',isEqualTo: selectedCat).withConverter<MainCategoryDeprecated>(
    fromFirestore: (snapshot, _) => MainCategoryDeprecated.fromJson(snapshot.data()!),
    toFirestore: (categories, _) => categories.toJson() , );
}
