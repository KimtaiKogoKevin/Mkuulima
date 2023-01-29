import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/checkout/billingAddressBloc/billing_address_bloc.dart';
import '../../repositories/User/userRepository.dart';
import 'forms/billingAddressForm.dart';


class BillingAddressPage extends StatelessWidget {
  const BillingAddressPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const BillingAddressPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: BlocProvider(
        create: (context) => BillingAddressBloc(
          userRepository: context.read<UserRepository>(),
        ),
        child: const BillingAddressForm(),
      ),
    );
  }
}