import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../models/Product.dart';
import '../../models/Product_model_base.dart';

class CartItemSamplesBloc extends StatelessWidget {
  const CartItemSamplesBloc(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);
  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          padding: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.white,
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
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(right: 15),
                  child: Image.network(product.imageUrls[0],
                      width: 100, height: 80, fit: BoxFit.cover),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.productName,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5))),
                      Text('Sh ${product.regularPrice}',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5))),
                    ],
                  )),
              const Spacer(),
              BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                if (state is CartLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CartLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: InkWell(
                                onTap: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddProduct(product));
                                },
                                child:
                                    const Icon(CupertinoIcons.plus, size: 18),
                              ),
                            ),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  '$quantity',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5)),
                                )),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: InkWell(
                                  onTap: () {
                                    context
                                        .read<CartBloc>()
                                        .add(RemoveProduct(product));
                                  },
                                  child: const Icon(CupertinoIcons.minus,
                                      size: 18)),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('Something Went Wrong'));
                }
              })
            ],
          ),
        ),
      ],
    );
  }
}
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


     // ],
   // ),
//   ),
// );
