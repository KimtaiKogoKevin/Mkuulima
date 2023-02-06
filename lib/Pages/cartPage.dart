import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkuulima/widgets/custom_app_bar.dart';

import '../blocs/cart/cart_bloc.dart';
import '../models/Product.dart';
import '../widgets/cart/cart_bottom_nav_bar.dart';
import '../widgets/cart/cartitems.dart';
import '../widgets/homeappbar.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  static const String routeName = '/cartPage';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartPage());
  }

  @override
  Widget build(BuildContext context) {
    final Product product;
    return Scaffold(
      appBar:  const HomeAppBar(title: 'Cart'),

      body: BlocBuilder<CartBloc,CartState>(builder:(context,state) {
        if( state is CartLoading){
          return const Center  ( child:CircularProgressIndicator());
        }
        else if (state is CartLoaded){
          return ListView.builder(
            itemCount:state.cart.productQuantity(state.cart.products).keys.length,
              itemBuilder: (context,index){
              return  CartItemSamples(
                  product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                  quantity:  state.cart.productQuantity(state.cart.products).values.elementAt(index)
              );

              },


          );
        }
        else {
          return const Text('Something Went Wrong');
        }
      }),






      bottomNavigationBar: const CartBottomNavBar(),
    );
  }
}
