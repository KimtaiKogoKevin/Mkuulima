

import '../../models/Category.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Category checkout);
}