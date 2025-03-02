part of 'checkout_bloc.dart';



abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? fullName;
  final String? email;
  final String? address;

  final String? city;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final CheckOut checkout;
  // final PaymentMethod paymentMethod;

  CheckoutLoaded({
    this.fullName,
    this.email,
    this.address,
    this.city,
    this.country,
    this.zipCode,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
    // this.paymentMethod = PaymentMethod.google_pay,
  }) : checkout = CheckOut(
    fullName: fullName,
    email: email,
    address: address,
    city: city,
    country: country,
    zipCode: zipCode,
    products: products,
    subtotal: subtotal,
    deliveryFee: deliveryFee,
    total: total,
  );

  @override
  List<Object?> get props => [
    fullName,
    email,
    address,
    city,
    country,
    zipCode,
    products,
    subtotal,
    deliveryFee,
    total,
    checkout,
    // paymentMethod,
  ];
}