import 'package:equatable/equatable.dart';

import 'Product.dart';

class WishList extends Equatable {

  final List <Product> products;
  const WishList({
    this.products = const <Product>[]
  });
  @override
  // TODO: implement props
  List<Object?> get props => [products];

}