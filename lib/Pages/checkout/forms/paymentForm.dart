import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';


import '../../../blocs/checkout/Payment/payment_bloc.dart';
import '../../../blocs/checkout/checkout_cubit/checkout_cubit.dart';
import '../ResultsPage.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentBloc2, PaymentState2>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Something went wrong!')),
            );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            _CardNameInput(),
            const SizedBox(height: 12.0),
            _CardNumberInput(),
            const SizedBox(height: 12.0),
            _ExpiryDateInput(),
            const SizedBox(height: 12.0),
            _CvvNumberInput(),
            const SizedBox(height: 12.0),
            Row(
              children: [
                _SubmitButton(),
                const SizedBox(width: 8.0),
                _CancelButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CardNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc2, PaymentState2>(
      buildWhen: (previous, current) => previous.cardName != current.cardName,
      builder: (context, state) {
        return TextField(
          key: const Key('paymentForm_cardNameInput_textField'),
          onChanged: (cardName) =>
              context.read<PaymentBloc2>().add(CardNameChanged(cardName)),
          decoration: InputDecoration(
            labelText: 'Enter card name',
            errorText:
            state.cardName.invalid ? state.cardName.error?.message : null,
          ),
        );
      },
    );
  }
}

class _CardNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc2, PaymentState2>(
      buildWhen: (previous, current) =>
      previous.cardNumber != current.cardNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('paymentForm_cardNumberInput_textField'),
          onChanged: (cardNumber) =>
              context.read<PaymentBloc2>().add(CardNumberChanged(cardNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter card number',
            errorText: state.cardNumber.invalid
                ? state.cardNumber.error?.message
                : null,
          ),
        );
      },
    );
  }
}

class _ExpiryDateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc2, PaymentState2>(
      buildWhen: (previous, current) =>
      previous.expiryDate != current.expiryDate,
      builder: (context, state) {
        return TextField(
          key: const Key('paymentForm_expiryDateInput_textField'),
          onChanged: (expiryDate) =>
              context.read<PaymentBloc2>().add(ExpiryDateChanged(expiryDate)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Expiry Date',
            errorText: state.expiryDate.invalid
                ? state.expiryDate.error?.message
                : null,
          ),
        );
      },
    );
  }
}

class _CvvNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc2, PaymentState2>(
      buildWhen: (previous, current) => previous.cvvNumber != current.cvvNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('paymentForm_CvvNumberInput_textField'),
          onChanged: (cvvNumber) =>
              context.read<PaymentBloc2>().add(CvvNumberChanged(cvvNumber)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'CVV',
            errorText:
            state.cvvNumber.invalid ? state.cvvNumber.error?.message : null,
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentBloc2, PaymentState2>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const ResultPage()),
          );
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const CircularProgressIndicator();
        } else {
          return ElevatedButton(
            key: const Key('paymentForm_submitButton_elevatedButton'),
            style: ElevatedButton.styleFrom(elevation: 0),
            onPressed: state.status.isValidated
                ? () => context.read<PaymentBloc2>().add(FormSubmitted())
                : null,
            child: const Text('SUBMIT'),
          );
        }
      },
    );
  }
}

class _CancelButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc2, PaymentState2>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const SizedBox.shrink()
            : TextButton(
          key:
          const Key('billingAddressForm_cancelButton_elevatedButton'),
          onPressed: () => context.read<CheckoutCubit>().stepCancelled(),
          child: const Text('CANCEL'),
        );
      },
    );
  }
}