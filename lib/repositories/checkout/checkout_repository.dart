import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/CheckOut.dart';
import 'checkout_base_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addCheckout(CheckOut checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}