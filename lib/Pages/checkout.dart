import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/checkout/checkout_bloc.dart';
import '../widgets/custom_text_formfield.dart';
import '../widgets/homeappbar.dart';
import '../widgets/ordersummary.dart';

class CheckOutPageDeprecated extends StatelessWidget {
  CheckOutPageDeprecated({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static const String routeName = '/checkoutdeprecated';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CheckOutPageDeprecated());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(title:"CheckOut"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(children: [
                  Container(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text("Customer Information",
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  CustomTextFormField(
                    title: 'Email',
                    onChanged: (value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(email: value));
                    },
                  ),
                  CustomTextFormField(
                    title: 'Full Name',
                    onChanged: (value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(fullName: value));
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'DELIVERY INFORMATION',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  CustomTextFormField(
                    title: 'Address',
                    onChanged: (value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(address: value));
                    },
                  ),
                  CustomTextFormField(
                    title: 'City',
                    onChanged: (value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(city: value));
                    },
                  ),
                  CustomTextFormField(
                    title: 'Country',
                    onChanged: (value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(country: value));
                    },
                  ),
                  CustomTextFormField(
                    title: 'ZIP Code',
                    onChanged: (value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(zipCode: value));
                    },
                  ),
                ]),
                Column(
                  children: [
                    Container(
                      height: 60,
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/payment-selection',
                                );
                              },
                              child: Text(
                                'SELECT A PAYMENT METHOD',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'ORDER SUMMARY',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const OrderSummary()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
