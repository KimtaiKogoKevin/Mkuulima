part of 'subcat_product_bloc.dart';



abstract class ProductSubCatEvent extends Equatable {
  const ProductSubCatEvent();

  @override
  List<Object> get props => [];
}

class LoadSubCatProducts extends ProductSubCatEvent {

}



class UpdateSubCatProducts extends ProductSubCatEvent {
  final List<Product> products;

  const UpdateSubCatProducts(this.products);

  @override
  List<Object> get props => [products];
}
