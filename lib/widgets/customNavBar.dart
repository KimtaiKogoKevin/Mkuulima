import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/checkout/checkout_bloc.dart';
import '../models/paymentMethodModel.dart';
class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override

    Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          // BlocBuilder<CheckoutBloc, CheckoutState>(
          //   builder: (context, state) {
          //     // if (state is CheckoutLoading) {
          //     //   return Center(
          //     //     child: CircularProgressIndicator(
          //     //       color: Colors.white,
          //     //     ),
          //     //   );
          //     // }
          //     // if (state is CheckoutLoaded) {
          //     //   if (state.paymentMethod == PaymentMethod.credit_card) {
          //     //     return Container(
          //     //       child: Text(
          //     //         'Pay with Credit Card',
          //     //         style: Theme.of(context)
          //     //             .textTheme
          //     //             .headline4!
          //     //             .copyWith(color: Colors.white),
          //     //       ),
          //     //     );
          //     //   }
          //     //   if (Platform.isAndroid &&
          //     //       state.paymentMethod == PaymentMethod.google_pay) {
          //     //     return GooglePay(
          //     //       products: state.products!,
          //     //       total: state.total!,
          //     //     );
          //     //   }
          //     //   if (Platform.isIOS &&
          //     //       state.paymentMethod == PaymentMethod.apple_pay) {
          //     //     return ApplePay(
          //     //       products: state.products!,
          //     //       total: state.total!,
          //     //     );
          //     //   } else {
          //     //     return ElevatedButton(
          //     //       onPressed: () {
          //     //         Navigator.pushNamed(context, '/payment-selection');
          //     //       },
          //     //       style: ElevatedButton.styleFrom(primary: Colors.white),
          //     //       child: Text(
          //     //         'CHOOSE PAYMENT',
          //     //         style: Theme.of(context).textTheme.headline3,
          //     //       ),
          //     //     );
          //     //   }
          //     // } else {
          //     //   return Text('Something went wrong');
          //     // }
          //   },
          // ),
        ],
      );
    }
  }

