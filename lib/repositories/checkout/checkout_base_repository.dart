

import '../../models/CheckOut.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(CheckOut checkout);
}