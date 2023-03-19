part of 'payment_bloc.dart';


abstract class PaymentEvent2 extends Equatable {
  const PaymentEvent2();

  @override
  List<Object> get props => [];
}

class CardNameChanged extends PaymentEvent2 {
  final String cardName;
  const CardNameChanged(this.cardName);

  @override
  List<Object> get props => [cardName];
}

class CardNumberChanged extends PaymentEvent2 {
  final String cardNumber;
  const CardNumberChanged(this.cardNumber);

  @override
  List<Object> get props => [cardNumber];
}

class ExpiryDateChanged extends PaymentEvent2 {
  final String expiryDate;
  const ExpiryDateChanged(this.expiryDate);

  @override
  List<Object> get props => [expiryDate];
}

class CvvNumberChanged extends PaymentEvent2 {
  final String cvvNumber;
  const CvvNumberChanged(this.cvvNumber);

  @override
  List<Object> get props => [cvvNumber];
}

class FormSubmitted extends PaymentEvent2 {}