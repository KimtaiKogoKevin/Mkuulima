import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:intl/intl.dart';
import 'models/Product.dart';

class FirebaseService {
  CollectionReference homeBanner =
  FirebaseFirestore.instance.collection('HomeBanner');
  CollectionReference categories =
  FirebaseFirestore.instance.collection('categories');
  CollectionReference mainCategories =
  FirebaseFirestore.instance.collection('mainCategories');
  CollectionReference subCategories =
  FirebaseFirestore.instance.collection('subCategories');
  CollectionReference Products =
  FirebaseFirestore.instance.collection('Products');

  // String formattedNumber(number) {
  //   var f = NumberFormat('# ,## ,###');
  //   String changedNumber = f.format(number);
  //   return changedNumber;
  // }

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('Products')
        .snapshots()
        .map((snapshot) {
      // print(snapshot);

      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
  // Stream<List<Product>> getAllSubCatProducts() {
  //   return _firebaseFirestore
  //       .collection('Products').where('subCategory',isEqualTo: 'subCategory')
  //       .snapshots()
  //       .map((snapshot) {
  //     // print(snapshot);
  //
  //     return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
  //   });
  // }

}