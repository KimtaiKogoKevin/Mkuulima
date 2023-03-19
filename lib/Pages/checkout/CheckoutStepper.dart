import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/checkout_cubit/checkout_cubit.dart';
import 'BillingAddressPage.dart';
import 'PaymentPage.dart';
import 'PersonalInfoPage.dart';

class CheckoutStepper extends StatelessWidget {
  const CheckoutStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutStateQubit>(
      builder: (context, state) {
        return Stepper(
          type: StepperType.horizontal,
          currentStep: state.activeStepperIndex,
          onStepTapped: context.read<CheckoutCubit>().stepTapped,
          controlsBuilder: (context, controlDetails) {
            return const SizedBox.shrink();
          },
          steps: [
            Step(
              title: const Text('Personal Info'),
              content: const PersonalInfoPage(),
              isActive: state.activeStepperIndex >= 0,
              state: state.activeStepperIndex >= 0
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: const Text('Address'),
              content: const BillingAddressPage(),
              isActive: state.activeStepperIndex >= 1,
              state: state.activeStepperIndex >= 1
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: const Text('Payment'),
              content: const PaymentPage(),
              isActive: state.activeStepperIndex >= 2,
              state: state.activeStepperIndex >= 2
                  ? StepState.complete
                  : StepState.disabled,
            ),
          ],
        );
      },
    );
  }
}