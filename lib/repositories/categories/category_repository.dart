import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:tryit_customer_app/models/Category.dart';
//import 'package:tryit_customer_app/models/MainCategory.dart';

import '../../models/Category.dart';
// import '../../models/SubCategory.dart';
// import 'base_category_repository.dart';
import 'category_base_repository.dart';

class CategoryRepository extends BaseCategoryRepository {

  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    // TODO: implement getAllCategories
    return _firebaseFirestore.collection('categories').snapshots().map((
        snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }

  // @override
  // Stream<List<MainCategory>> getAllMainCategories({selectedCat}) {
  //   return _firebaseFirestore.collection('mainCategories').where('category',isEqualTo: selectedCat).snapshots().map((
  //       snapshot) {
  //     return snapshot.docs.map((doc) => MainCategory.fromSnapshot(doc)).toList();
  //   });
  // }
  //
  // @override
  // Stream<List<SubCategory>> getAllSubCategories({subCatSelected}) {
  //   return _firebaseFirestore.collection('subCategories').where('mainCategories',isEqualTo: subCatSelected).snapshots().map((
  //       snapshot) {
  //     return snapshot.docs.map((doc) => SubCategory.fromSnapshot(doc)).toList();
  //   });
  }







