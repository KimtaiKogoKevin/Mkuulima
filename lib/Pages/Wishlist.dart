import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/Product.dart';
import '../widgets/ProductCard.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/homeappbar.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishlistScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(title:"WishList"),
        body:
            BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 1 / 0),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard2(
                      product: state.wishlist.products[index],
                      widthFactor: 1.1,
                      leftPosition: 100,
                      isWishlist: true,
                    ),
                  );
                });
          } else {
            return const Center(child: Text('Something Went Wrong'));
          }
        }));
  }
}
