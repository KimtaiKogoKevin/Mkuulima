part of 'subcat_product_bloc.dart';

abstract class ProductSubCatState extends Equatable {
  const ProductSubCatState();

  @override
  List<Object> get props => [];
}


class ProductSubCatLoading extends ProductSubCatState {
  @override
  List<Object> get props => [];
}

class ProductSubCatLoaded extends ProductSubCatState {
  final List<Product> products;
  const ProductSubCatLoaded( {this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}

class ProductError extends ProductSubCatState {
   final String error ;
   const ProductError( {this.error="Error"});


   @override
  List<Object> get props => [error];

}
