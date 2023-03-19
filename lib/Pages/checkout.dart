import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/checkout/checkout_bloc.dart';
import '../blocs/checkout/checkout_cubit/checkout_cubit.dart';
import '../widgets/custom_text_formfield.dart';
import '../widgets/homeappbar.dart';
import '../widgets/ordersummary.dart';
import 'Orders/orderSummaryProviderView.dart';

class CheckOutPageDeprecated extends StatelessWidget {
  CheckOutPageDeprecated({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static const String routeName = '/checkoutDeprecated';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CheckOutPageDeprecated());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(title: "CheckOut"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
                builder: (context, state) {
              if (state is CheckoutLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text("Customer Information",
                                style: Theme.of(context).textTheme.headlineSmall),
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
                          const SizedBox(height: 55),
                          Text(
                            'DELIVERY INFORMATION',
                            style: Theme.of(context).textTheme.headlineSmall,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Container(
                        //   height: 60,
                        //   alignment: Alignment.bottomCenter,
                        //   decoration: const BoxDecoration(color: Colors.black),
                        //   child: Row(
                        //     children: [
                        //       Center(
                        //         child: TextButton(
                        //           onPressed: () {
                        //             Navigator.pushNamed(
                        //               context,
                        //               '/payment-selection',
                        //             );
                        //           },
                        //           child: Text(
                        //             'SELECT A PAYMENT METHOD',
                        //             style: Theme.of(context)
                        //                 .textTheme
                        //                 .headline6!
                        //                 .copyWith(color: Colors.white),
                        //           ),
                        //         ),
                        //       ),
                        //       IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(
                        //           Icons.arrow_forward,
                        //           color: Colors.white,
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),

                        const SizedBox(height: 40),
                        Text(
                          'ORDER SUMMARY',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const OrderSummary()
                      ],
                    )
                  ],
                );
              } else {
                return const Text('Something went wrong');
              }
            }),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                        if (state is CheckoutLoaded) {
                          return  Expanded(
                            child: InkWell(
                              onTap: () {
                                //print("tapped");
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data')),
                                  );
                                }

                                context
                                    .read<CheckoutBloc>()
                                    .add(ConfirmCheckout(checkout: state.checkout));
                                //Navigator.pushNamed(context, '/checkout');
                              },

                              child: Container(
                                height: 50,
                                alignment: Alignment.center,
                                width: double.infinity,
                                decoration: BoxDecoration(color: const Color(0xFF4C53A5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text("Order Now", style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),),
                              ),
                            ),
                          );


                          //   ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //
                          //       backgroundColor:  const Color(0xFF4C53A5),
                          //
                          //       shape: RoundedRectangleBorder(
                          //
                          //           borderRadius: BorderRadius.circular(5)),
                          //       elevation: 0),
                          //   onPressed: () {
                          //     //print("tapped");
                          //     if (_formKey.currentState!.validate()) {
                          //       // If the form is valid, display a snackbar. In the real world,
                          //       // you'd often call a server or save the information in a database.
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         const SnackBar(content: Text('Processing Data')),
                          //       );
                          //     }
                          //
                          //     context
                          //         .read<CheckoutBloc>()
                          //         .add(ConfirmCheckout(checkout: state.checkout));
                          //   },
                          //   child: Text(
                          //     'OrderNow',
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .headline3!
                          //         .copyWith(color: Colors.white),
                          //   ),
                          // );

                        }
                        if (state is CheckoutLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return (const Text('Something Went Wrong'));
                        }
                      }),

                ]),
          ),
        ),
      ),

    );
  }
}
