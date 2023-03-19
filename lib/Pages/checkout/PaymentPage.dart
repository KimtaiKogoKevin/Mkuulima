import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../blocs/checkout/Payment/payment_bloc.dart';
import '../../repositories/User/userRepository.dart';
import 'forms/paymentForm.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const PaymentPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: BlocProvider(
        create: (context) => PaymentBloc2(
          userRepository: context.read<UserRepository>(),
        ),
        child: const PaymentForm(),
      ),
    );
  }
}