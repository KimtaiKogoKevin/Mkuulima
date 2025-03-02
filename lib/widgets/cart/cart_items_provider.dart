import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../SQFlite/CartProvider.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../models/Product.dart';
import '../../models/Product_model_base.dart';

class CartItemSamplesProvider extends StatelessWidget {
  const CartItemSamplesProvider(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);
  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CartProvider>(
          builder:(BuildContext context, provider , widget){
            return  ListView.builder(
              shrinkWrap:true,
              itemCount:provider.cart.length,
              itemBuilder:(context,index){
              return Container(
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
                      child:   Image(
                        height: 80,
                        width: 80,
                        image:
                        AssetImage(provider.cart[index].imageUrls as String),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.productName!,
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
              );
              }
            );


          }
        ),
      ],
    );
  }
}
