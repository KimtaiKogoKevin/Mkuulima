import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../SQFlite/CartProvider.dart';
import '../../utils/ReusableWidget.dart';
import '/blocs/cart/cart_bloc.dart';

class OrderSummaryProvider extends StatelessWidget {
  const OrderSummaryProvider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (BuildContext context,provider,widget ) {

          return Column(


            children: [
              const Divider(thickness: 2),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Consumer<CartProvider>(
                  builder:(BuildContext context, value , Widget? child) {
                    final ValueNotifier<int?> totalPrice = ValueNotifier(null);
                    for (var element in value.cart) {
                      totalPrice.value =
                      ((element.regularPrice* element.quantity.value) +
                          (totalPrice.value ?? 0)) as int?;
                    }

                  return  ValueListenableBuilder<int?>(
                       valueListenable: totalPrice,
                    builder:(context,val,child) {
                      return ReusableWidget(
                        title:'SUBTOTAL',
                          value: r'$' + (val?.toStringAsFixed(2) ?? '0'));





                    },
                  );
                  }
                ),
              ),
              // Padding(
              //   padding:
              //   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text('DELIVERY FEE',
              //           style: Theme.of(context).textTheme.headline6),
              //       Text('\$${provider.deliveryFeeString}',
              //           style: Theme.of(context).textTheme.headline6),
              //     ],
              //   ),
              // ),
              SizedBox(height: 10),
              Stack(

                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(50),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(5.0),
                  //   width: MediaQuery.of(context).size.width - 10,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black,
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           'TOTAL',
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .headline6!
                  //               .copyWith(color: Colors.white),
                  //         ),
                  //         Text(
                  //           '\$${provider.subTotal}',
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .headline6!
                  //               .copyWith(color: Colors.white),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, '/checkout');
                  //   },
                  //   child: Container(
                  //     height: 50,
                  //     alignment: Alignment.center,
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(color: const Color(0xFF4C53A5),
                  //         borderRadius: BorderRadius.circular(5)),
                  //     child: const Text("Check Out", style: TextStyle(
                  //         fontSize: 22,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white),),
                  //   ),
                  // )

                ],
              ),
            ],
          );
        }



    );
  }
}