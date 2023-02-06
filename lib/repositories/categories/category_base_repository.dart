import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/Category.dart';
//import '../../models/MainCategory.dart';
//import '../../models/SubCategory.dart';

abstract class BaseCategoryRepository {




  Stream<List<Category>>getAllCategories();
  // Stream<List<SubCategory>>getAllSubCategories();
  // Stream<List<MainCategory>>getAllMainCategories();

}