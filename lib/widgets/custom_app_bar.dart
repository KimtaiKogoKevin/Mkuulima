import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/cart/cart_bloc.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child:
        const Icon(Icons.arrow_back, size: 30, color: Color(0xFF4C53A5)),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoaded) {
          return Row(
            children: [
               Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Text(title,
                      style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)))),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "cartPage");
                },
                child: Badge(
                    badgeColor: Colors.red,
                    padding: const EdgeInsets.all(7),
                    badgeContent: Text(
                      state.cart.productQuantity(state.cart.products).values.toString().replaceAll("(","").replaceAll(")","") ?? '0',

                      style: const TextStyle(color: Colors.black),
                    ) ,
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 32,
                      color: Color(0xFF4C53A5),
                    )),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, size: 32,
                color: Color(0xFF4C53A5),))
            ],
          );
        } else if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(child: Text('Something Went Wrong'));
        }
      }),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
