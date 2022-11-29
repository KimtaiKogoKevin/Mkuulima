import 'package:equatable/equatable.dart';

import 'Product.dart';

class Cart extends Equatable {
  final List<Product>products;
   const Cart({this.products = const <Product>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [products];


  Map productQuantity(products){
    var quantity = {};


    products.forEach((product){
      if(!quantity.containsKey(product)){
        quantity[product]=1;
      }
      else if (quantity.isEmpty) {
        quantity[product]=0;

      }
      else {
        quantity[product] +=1;

      }
    });
    return quantity;

  }
  double get subtotal =>
      products.fold(0, (total, current) => total + current.regularPrice!);

  String get subtotalString => subtotal.toStringAsFixed(2);

  double deliveryFee(subtotal) {
    if (subtotal >= 1.00 && subtotal <= 3000) {
      return 150.0;
    } else {
      return 0.0;
    }
  }
  double total(subtotal , deliveryFee){
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 25000.00) {
      return 'You have free Delivery';
    } else {
      double deficit = 2500.00 - subtotal;
      return 'Add sh $deficit to get free delivery ';
    }
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get totalString => total(subtotal ,deliveryFee).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);





}