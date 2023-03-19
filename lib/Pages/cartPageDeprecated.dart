import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../SQFlite/CartProvider.dart';
import '../SQFlite/DBHelper.dart';
import '../models/CartDeprecated.dart';
import '../utils/ReusableWidget.dart';
import '../widgets/homeappbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/cartscreen';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();
  List<bool> tapped = [];

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);





    return Scaffold(
      appBar: const HomeAppBar(
        title: 'Cart Page',
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<CartProvider>(

              builder: (BuildContext context, provider, widget) {
                if (provider.cart.isEmpty) {
                  return const Center(
                      child: Text(
                    'Your Cart is Empty',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ));
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.cart.length,
                      itemBuilder: (context, index) {

                      return  Column(
                          children:[
                            Container(
                              height:120,
                              margin:const EdgeInsets.symmetric(horizontal:15,vertical:20),
                              padding:const EdgeInsets.only(top:30),
                              decoration:BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: Row(
                                children: [
                                  Radio(
                                    value: "",
                                    groupValue: "",
                                    activeColor: const Color(0xFF4C53A5),
                                    onChanged: (index) {},

                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      // decoration: BoxDecoration(image: ),
                                      margin: const EdgeInsets.only(right: 15),
                                      child:
                                       Image.memory(provider.cart[index].imageUrls!)
                                        )
                                    ),

                                  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(provider.cart[index].productName,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C53A5))),
                                          Text('Sh ${provider.cart[index].regularPrice}',
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF4C53A5))),
                                        ],
                                      )),
                                  const Spacer(),
                                  ValueListenableBuilder<int>(

                                      valueListenable:
                                      provider.cart[index].quantity,
                                      builder: (context, val, child) {
                                        return PlusMinusButtons(
                                          addQuantity: () {
                                            cart.addQuantity(
                                                provider.cart[index].id! );
                                            dbHelper!
                                                .updateQuantity(CartDeprecated(
                                                id: provider.cart[index].id,
                                                userId:provider.cart[index].userId,
                                                productId: provider.cart[index].productId,
                                                //  subCategory: provider.cart[index].subCategory,

                                                //productId: index.toString(),
                                                productName: provider
                                                    .cart[index].productName,
                                                regularPrice: provider
                                                    .cart[index].regularPrice,
                                                // discountPrice: provider
                                                //     .cart[index].discountPrice,
                                                quantity: ValueNotifier(
                                                    provider.cart[index]
                                                        .quantity.value),
                                                // unitTag: provider
                                                //     .cart[index].unitTag,
                                                imageUrls: provider
                                                    .cart[index].imageUrls))
                                                .then((value) {
                                              setState(() {
                                                cart.addSubTotalPrice(double.parse(
                                                    provider
                                                        .cart[index].regularPrice
                                                        .toString()));
                                              });
                                            });
                                          },
                                          deleteQuantity: () {
                                            cart.deleteQuantity(
                                                provider.cart[index].id!);
                                            cart.removeSubTotalPrice(double.parse(
                                                provider.cart[index].regularPrice
                                                    .toString()));
                                          },
                                          text: val.toString(),
                                        );
                                      }),
                                  IconButton(
                                      onPressed: () {
                                        dbHelper!.deleteCartItem(
                                            provider.cart[index].id! as int);
                                        provider
                                            .removeItem(provider.cart[index].id!);
                                        provider.removeCounter();
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red.shade800,
                                      )),
                                ],
                              ),
                            )
                          ]
                        );
                        // return Card(
                        //   color: Colors.blueGrey.shade200,
                        //   elevation: 5.0,
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(4.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: [
                        //         Expanded(
                        //             child:
                        //             Image.memory(provider.cart[index].imageUrls! )),
                        //            // Image.network(provider.cart[index].imageUrls![0])),
                        //         // Image(
                        //         //   height: 80,
                        //         //   width: 80,
                        //         //   image:
                        //         //   AssetImage(provider.cart[index].imageUrls),
                        //         // ),
                        //
                        //         SizedBox(
                        //           width: 130,
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               const SizedBox(
                        //                 height: 5.0,
                        //               ),
                        //               RichText(
                        //                 overflow: TextOverflow.ellipsis,
                        //                 maxLines: 1,
                        //                 text: TextSpan(
                        //                     text: 'Name: ',
                        //                     style: TextStyle(
                        //                         color: Colors.blueGrey.shade800,
                        //                         fontSize: 16.0),
                        //                     children: [
                        //                       TextSpan(
                        //                           text:
                        //                               '${provider.cart[index].productName!}\n',
                        //                           style: const TextStyle(
                        //                               fontWeight:
                        //                                   FontWeight.bold)),
                        //                     ]),
                        //               ),
                        //               // RichText(
                        //               //   maxLines: 1,
                        //               //   text: TextSpan(
                        //               //       text: 'Unit: ',
                        //               //       style: TextStyle(
                        //               //           color: Colors.blueGrey.shade800,
                        //               //           fontSize: 16.0),
                        //               //       children: [
                        //               //         TextSpan(
                        //               //             text:
                        //               //             '${provider.cart[index].unitTag!}\n',
                        //               //             style: const TextStyle(
                        //               //                 fontWeight:
                        //               //                 FontWeight.bold)),
                        //               //       ]),
                        //               // ),
                        //               RichText(
                        //                 maxLines: 1,
                        //                 text: TextSpan(
                        //                     text: 'Price: ' r"$",
                        //                     style: TextStyle(
                        //                         color: Colors.blueGrey.shade800,
                        //                         fontSize: 16.0),
                        //                     children: [
                        //                       TextSpan(
                        //                           text:
                        //                            '${provider.cart[index].regularPrice!}\n',
                        //                           style: const TextStyle(
                        //                               fontWeight:
                        //                                   FontWeight.bold)),
                        //                     ]),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //         ValueListenableBuilder<int>(
                        //
                        //             valueListenable:
                        //                 provider.cart[index].quantity!,
                        //             builder: (context, val, child) {
                        //               return PlusMinusButtons(
                        //                 addQuantity: () {
                        //                   cart.addQuantity(
                        //                       provider.cart[index].id! as String );
                        //                   dbHelper!
                        //                       .updateQuantity(CartDeprecated(
                        //                           id: provider.cart[index].id,
                        //                           userId:provider.cart[index].userId,
                        //                           productId: provider.cart[index].productId,
                        //                           //  subCategory: provider.cart[index].subCategory,
                        //
                        //                           //productId: index.toString(),
                        //                           productName: provider
                        //                               .cart[index].productName,
                        //                           regularPrice: provider
                        //                               .cart[index].regularPrice,
                        //                           // discountPrice: provider
                        //                           //     .cart[index].discountPrice,
                        //                           quantity: ValueNotifier(
                        //                               provider.cart[index]
                        //                                   .quantity!.value),
                        //                           // unitTag: provider
                        //                           //     .cart[index].unitTag,
                        //                           imageUrls: provider
                        //                               .cart[index].imageUrls))
                        //                       .then((value) {
                        //                     setState(() {
                        //                       cart.addTotalPrice(double.parse(
                        //                           provider
                        //                               .cart[index].regularPrice
                        //                               .toString()));
                        //                     });
                        //                   });
                        //                 },
                        //                 deleteQuantity: () {
                        //                   cart.deleteQuantity(
                        //                       provider.cart[index].id! as String);
                        //                   cart.removeTotalPrice(double.parse(
                        //                       provider.cart[index].regularPrice
                        //                           .toString()));
                        //                 },
                        //                 text: val.toString(),
                        //               );
                        //             }),
                        //         IconButton(
                        //             onPressed: () {
                        //               dbHelper!.deleteCartItem(
                        //                   provider.cart[index].id! as int);
                        //               provider
                        //                   .removeItem(provider.cart[index].id! as String);
                        //               provider.removeCounter();
                        //             },
                        //             icon: Icon(
                        //               Icons.delete,
                        //               color: Colors.red.shade800,
                        //             )),
                        //       ],
                        //     ),
                        //   ),
                        // );

                      });
                }
              },
            ),
          ),
          Consumer<CartProvider>(
            builder: (BuildContext context, value, Widget? child) {
              final ValueNotifier<int?> totalPrice = ValueNotifier(null);
              for (var element in value.cart) {
                totalPrice.value =
                    ((element.regularPrice* element.quantity.value) +
                        (totalPrice.value ?? 0)) as int?;
              }
              return Column(
                children: [
                  ValueListenableBuilder<int?>(
                      valueListenable: totalPrice,
                      builder: (context, val, child) {
                        return ReusableWidget(
                            title: 'Sub-Total',
                            value: r'$' + (val?.toStringAsFixed(2) ?? '0'));
                      }),
                ],
              );
            },
          )
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Payment Successful'),
          //     duration: Duration(seconds: 2),
          //   ),
          // );
          Navigator.pushNamed(context,'/checkoutDeprecated');
        },
        child: Container(
          color: Colors.yellow.shade600,
          alignment: Alignment.center,
          height: 50.0,
          child: const Text(
            'Proceed to Pay',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  final VoidCallback deleteQuantity;
  final VoidCallback addQuantity;
  final String text;

  const PlusMinusButtons(
      {Key? key,
      required this.addQuantity,
      required this.deleteQuantity,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: deleteQuantity, icon: const Icon(Icons.remove)),
        Text(text),
        IconButton(onPressed: addQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }
}

