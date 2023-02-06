
import '../../models/Product.dart';
import '../../models/subCategoryDepracated.dart';

abstract class BaseSubCatProductRepository {
  Stream<List<Product>> getAllSubCatProducts(String subCatSelected );
}