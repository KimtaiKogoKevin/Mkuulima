import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../blocs/checkout/checkout_cubit/checkout_cubit.dart';
import 'CheckoutStepper.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckoutPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout Form'),
      ),
      body: BlocProvider<CheckoutCubit>(
        create: (_) => CheckoutCubit(3),
        child: const CheckoutStepper(),
      ),
    );
  }
}