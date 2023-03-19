part of 'checkout_cubit.dart';

class CheckoutStateQubit extends Equatable {
  const CheckoutStateQubit({
    this.activeStepperIndex = 0,
  });

  final int activeStepperIndex;

  CheckoutStateQubit copyWith({int? activeStepperIndex}) {
    return CheckoutStateQubit(
      activeStepperIndex: activeStepperIndex ?? this.activeStepperIndex,
    );
  }

  @override
  List<Object> get props => [activeStepperIndex];
}