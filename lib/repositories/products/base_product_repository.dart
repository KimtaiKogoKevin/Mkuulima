
import '../../models/Product.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}