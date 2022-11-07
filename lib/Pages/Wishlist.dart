import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/Product.dart';
import '../widgets/ProductCard.dart';
import '../widgets/home/home_app_bar.dart';

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
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back,
                size: 30, color: Color(0xFF4C53A5)),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            children: [
              const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text('WishList',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)))),
              Spacer(),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/wishlist',
                    );
                  },
                  child: Icon(Icons.favorite, size: 30, color: Colors.red))
            ],
          ),
        ),
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
