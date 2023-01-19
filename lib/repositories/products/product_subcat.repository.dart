import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/Product.dart';
import '../../models/subCategoryDepracated.dart';
import 'base_subcat_repository.dart';

class ProductSubCatRepository extends BaseSubCatProductRepository {
  final FirebaseFirestore _firebaseFirestore;
  ProductSubCatRepository( {FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Product>> getAllSubCatProducts( ) {

    return _firebaseFirestore
        .collection('Products').where('subCategory',isEqualTo: 'Nike Jordans')
        .snapshots()
        .map((snapshot) {

      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}