import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutStateQubit> {
  CheckoutCubit(this.stepperLength) : super(const CheckoutStateQubit());
  final int stepperLength;

  void stepTapped(int tappedIndex) =>
      emit(CheckoutStateQubit(activeStepperIndex: tappedIndex));

  void stepContinued() {
    if (state.activeStepperIndex < stepperLength - 1) {
      emit(CheckoutStateQubit(activeStepperIndex: state.activeStepperIndex + 1));
    } else {
      emit(CheckoutStateQubit(activeStepperIndex: state.activeStepperIndex));
    }
  }

  void stepCancelled() {
    if (state.activeStepperIndex > 0) {
      emit(CheckoutStateQubit(activeStepperIndex: state.activeStepperIndex - 1));
    } else {
      emit(CheckoutStateQubit(activeStepperIndex: state.activeStepperIndex));
    }
  }
}