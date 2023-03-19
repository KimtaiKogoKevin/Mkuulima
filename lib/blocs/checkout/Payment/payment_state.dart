part of 'payment_bloc.dart';

class PaymentState2 extends Equatable {
  const PaymentState2({
    this.cardName = const CardName.pure(),
    this.cardNumber = const CardNumber.pure(),
    this.expiryDate = const ExpiryDate.pure(),
    this.cvvNumber = const CvvNumber.pure(),
    this.status = FormzStatus.pure,
  });

  final CardName cardName;
  final CardNumber cardNumber;
  final ExpiryDate expiryDate;
  final CvvNumber cvvNumber;
  final FormzStatus status;

  PaymentState2 copyWith({
    CardName? cardName,
    CardNumber? cardNumber,
    ExpiryDate? expiryDate,
    CvvNumber? cvvNumber,
    FormzStatus? status,
  }) {
    return PaymentState2(
      cardName: cardName ?? this.cardName,
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cvvNumber: cvvNumber ?? this.cvvNumber,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props =>
      [cardName, cardNumber, expiryDate, cvvNumber, status];
}