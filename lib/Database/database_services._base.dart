import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Product.dart';
import '../models/Product_model_base.dart';
import '../models/employees.dart';
class DatabaseServices_base{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<ProductBase>> retrieveProducts() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("Products").get();

    return snapshot.docs
        .map((docSnapshot) => ProductBase.fromDocumentSnapshot(docSnapshot))
        .toList();
  }

}
