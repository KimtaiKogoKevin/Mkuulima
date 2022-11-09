import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return const Center (child: CircularProgressIndicator());
        }
        else if (state is CartLoaded) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //
                //     children: [
                //       const Text("Delivery Fee",
                //           style: TextStyle(
                //               fontSize: 22,
                //               fontWeight: FontWeight.bold,
                //               color: Color(0xFF4C53A5))),
                //       Text(
                //         state.cart.deliveryFeeString,
                //         style: const TextStyle(
                //             fontSize: 22,
                //             fontWeight: FontWeight.bold,
                //             color: Color(0xFF4C53A5)),
                //       ),
                //
                //     ]
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Text("Sub Total",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4C53A5))),
                    Text(
                      state.cart.subtotal.toString(),
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(color: const Color(0xFF4C53A5),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text("Check Out", style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),),
                  ),
                )
              ],
            ),
          );
        }
        else {
          return const Text("oops Something went wrong ");
        }
      }


      ),
    );
  }
}
