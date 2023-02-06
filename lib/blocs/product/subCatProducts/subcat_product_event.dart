part of 'subcat_product_bloc.dart';



abstract class ProductSubCatEvent extends Equatable {
  const ProductSubCatEvent();

  @override
  List<Object> get props => [];
}



class LoadSubCatProducts extends ProductSubCatEvent {



  @override
  List<Object> get props => [];

}


class  SubCatSelected extends ProductSubCatEvent{
  final String subCatSelected;
  const SubCatSelected (this.subCatSelected);

}



class UpdateSubCatProducts extends ProductSubCatEvent {
  final List<Product> products;

  const UpdateSubCatProducts(this.products,);

  @override
  List<Object> get props => [products];
}
