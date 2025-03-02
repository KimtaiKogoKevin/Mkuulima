import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../models/checkout/payment/card_name.dart';
import '../../../models/checkout/payment/card_number.dart';
import '../../../models/checkout/payment/cvv.dart';
import '../../../models/checkout/payment/expiry_date.dart';
import '../../../repositories/User/userRepository.dart';
import 'package:equatable/equatable.dart';


part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc2 extends Bloc<PaymentEvent2, PaymentState2> {
  final UserRepository userRepository;
  PaymentBloc2({required this.userRepository}) : super(const PaymentState2()) {
    on<CardNameChanged>(_onCardNameChanged);
    on<CardNumberChanged>(_onCardNumberChanged);
    on<ExpiryDateChanged>(_onExpiryDateChanged);
    on<CvvNumberChanged>(_onCvvNumberChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  void _onCardNameChanged(
      CardNameChanged event,
      Emitter<PaymentState2> emit,
      ) {
    final cardName = CardName.dirty(event.cardName);
    emit(state.copyWith(
      cardName: cardName,
      status: Formz.validate(
          [cardName, state.cardNumber, state.expiryDate, state.cvvNumber]),
    ));
  }

  void _onCardNumberChanged(
      CardNumberChanged event,
      Emitter<PaymentState2> emit,
      ) {
    final cardNumber = CardNumber.dirty(event.cardNumber);
    emit(state.copyWith(
      cardNumber: cardNumber,
      status: Formz.validate(
          [state.cardName, cardNumber, state.expiryDate, state.cvvNumber]),
    ));
  }

  void _onExpiryDateChanged(
      ExpiryDateChanged event,
      Emitter<PaymentState2> emit,
      ) {
    final expiryDate = ExpiryDate.dirty(event.expiryDate);
    emit(state.copyWith(
      expiryDate: expiryDate,
      status: Formz.validate(
          [state.cardName, state.cardNumber, expiryDate, state.cvvNumber]),
    ));
  }

  void _onCvvNumberChanged(
      CvvNumberChanged event,
      Emitter<PaymentState2> emit,
      ) {
    final cvvNumber = CvvNumber.dirty(event.cvvNumber);
    emit(state.copyWith(
      cvvNumber: cvvNumber,
      status: Formz.validate(
          [state.cardName, state.cardNumber, state.expiryDate, cvvNumber]),
    ));
  }

  void _onFormSubmitted(
      FormSubmitted event,
      Emitter<PaymentState2> emit,
      ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await userRepository.updatePayment(
          cardName: state.cardName.value,
          cardNumber: state.cardNumber.value,
          expiryDate: state.expiryDate.value,
          cvvNumber: state.cvvNumber.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}