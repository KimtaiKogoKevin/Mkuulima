import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../SQFlite/CartProvider.dart';
import '../blocs/cart/cart_bloc.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
        //   return AppBar(
        //     leading:badges.Badge(badgeContent: Consumer<CartProvider>(
        //       builder: (context, value, child) {
        //     return Text(
        //       value.getCounter().toString(),
        //       style: const TextStyle(
        //           color: Colors.white, fontWeight: FontWeight.bold),
        //     );
        //   },
        // ),
        // position:  badges.BadgePosition.topEnd(top:30 ,end:30),
        // child: IconButton(
        // onPressed: () {},
        // icon: const Icon(Icons.shopping_cart),
        // ),
        //
        // ),
        //
        //     // InkWell(
        //     //   onTap: () {
        //     //     Navigator.pop(context);
        //     //   },
        //     //   child: const Icon(Icons.arrow_back,
        //     //       size: 30, color: Color(0xFF4C53A5)),
        //     // ),
        //     backgroundColor: Colors.white,
        //     elevation: 0,
        //     title: Row(
        //       children: [
        //         Padding(
        //             padding: const EdgeInsets.only(left: 0),
        //             child: Text(title,
        //                 style: const TextStyle(
        //                     fontSize: 23,
        //                     fontWeight: FontWeight.bold,
        //                     color: Color(0xFF4C53A5)))),
        //         const Spacer(),
        //
        //         // InkWell(
        //         //   onTap: () {
        //         //     Navigator.pushNamed(context, "cartPage");
        //         //   },
        //         //   child: badges.Badge(
        //         //       showBadge: state.cart
        //         //               .productQuantity(state.cart.products)
        //         //               .isEmpty
        //         //           ? false
        //         //           : true,
        //         //       badgeColor: Colors.red,
        //         //       padding: const EdgeInsets.all(7),
        //         //       badgeContent:
        //         //       Text(
        //         //         state.cart
        //         //             .productQuantity(state.cart.products)
        //         //             .length
        //         //             .toString()
        //         //             .replaceAll("(", "")
        //         //             .replaceAll(")", ""),
        //         //         style: const TextStyle(color: Colors.black),
        //         //       ),
        //         //       child: const Icon(
        //         //         Icons.shopping_bag_outlined,
        //         //         size: 32,
        //         //         color: Color(0xFF4C53A5),
        //         //       )),
        //         // ),
        //
        //
        //         // IconButton(
        //         //     onPressed: () {},
        //         //     icon: const Icon(
        //         //       Icons.more_vert,
        //         //       size: 32,
        //         //       color: Color(0xFF4C53A5),
        //         //     )),
        //       ],
        //     ),
        //
        //   );
          return AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.maybePop(context);
              },
              child: const Icon(Icons.arrow_back,
                  size: 30, color: Color(0xFF4C53A5)),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
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
                  child: badges.Badge(
                      showBadge: state.cart
                          .productQuantity(state.cart.products)
                          .isEmpty
                          ? false
                          : true,
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.red,
                      ),
                      badgeContent:
                      // Consumer<CartProvider>(
                      //   builder: (context, value, child) {
                      //     return Text(
                      //       value.getCounter().toString(),
                      //       style: const TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold),
                      //     );
                      //   },
                      // ),
                       Text(
                         state.cart
                             .productQuantity(state.cart.products)
                             .values
                             .toString()
                             .replaceAll("(", "")
                             .replaceAll(")", ""),
                         style: const TextStyle(color: Colors.black),
                       ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 32,
                        color: Color(0xFF4C53A5),
                      )),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 32,
                      color: Color(0xFF4C53A5),
                    )),
              ],
            ),
            // bottom: TabBar(
            //   indicator: UnderlineTabIndicator(
            //       borderSide: BorderSide(width: 5.0),
            //       insets: EdgeInsets.symmetric(horizontal: 16.0)),
            //   isScrollable: true,
            //   indicatorColor: Color(0xFF4C53A5),
            //   labelColor: Color(0xFF4C53A5),
            //   labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
            //   tabs: [
            //     Center(
            //       child: Container(
            //         width: MediaQuery.of(context).size.width / 3,
            //         child: Tab(
            //           text: "Home",
            //           icon: Icon(Icons.home_filled, color: Color(0xFF4C53A5)),
            //         ),
            //       ),
            //     ),
            //     Center(
            //       child: Container(
            //         // width:MediaQuery.of(context).size.width,
            //
            //         child: Tab(
            //             text: "Categories",
            //             icon: Icon(Icons.list, color: Color(0xFF4C53A5))),
            //       ),
            //     ),
            //     Center(
            //       child: Container(
            //         width: MediaQuery.of(context).size.width / 3,
            //         child: Tab(
            //           text: "Account",
            //           icon: Icon(Icons.person, color: Color(0xFF4C53A5)),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          );
        } else if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Center(child: Text('Something Went Wrong'));
        }
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
