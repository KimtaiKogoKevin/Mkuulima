import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mkuulima/blocs/product/product_bloc.dart';
import 'package:mkuulima/widgets/categories/categoryCarouselItem.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/Product.dart';
import '../widgets/Products/ProductsScreen.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/homeappbar.dart';
import '../widgets/Products/itemBottomNavBar.dart';
import '../widgets/Products/item_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemPage extends StatelessWidget {
   const ItemPage({Key? key, required this.product}) : super(key: key);
  static const String routeName = '/itemPage';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ItemPage(
              product: product,
            ));
  }

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      appBar:  HomeAppBar(title: product.productName),
      body: ProductScreen(product: product,),
      // ListView(children: [
      //   // CarouselSlider(
      //   //   options: CarouselOptions(
      //   //     aspectRatio: 1.5,
      //   //     viewportFraction: 0.9,
      //   //     enlargeCenterPage: true,
      //   //     enlargeStrategy: CenterPageEnlargeStrategy.height,
      //   //   ),
      //   //   items: [CategoryCarouselCard(product2: product)],
      //   // ),
      //   Container(
      //       height: MediaQuery.of(context).size.height * .35,
      //       padding: const EdgeInsets.only(bottom: 30),
      //       width: double.infinity,
      //       child: CategoryCarouselCard(product2: product)),
      //   Stack(children: [
      //     Container(
      //     padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
      //     decoration: const BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30),
      //         topRight: Radius.circular(30),
      //       ),
      //     ),
      //     child: SingleChildScrollView(
      //       child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               product.mainCategory.toString(),
      //               style: GoogleFonts.poppins(
      //                 fontSize: 15,
      //                 color: Colors.grey,
      //               ),
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   product.productName.toString(),
      //                   style: GoogleFonts.poppins(
      //                     fontSize: 22,
      //                     fontWeight: FontWeight.w600,
      //                   ),
      //                 ),
      //                 Text(
      //                   '\Sh ' + product.regularPrice.toString(),
      //                   style: GoogleFonts.poppins(
      //                     fontSize: 22,
      //                     fontWeight: FontWeight.w600,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             const SizedBox(height: 15),
      //             Text(
      //               product.productDescription.toString(),
      //               style: GoogleFonts.poppins(
      //                 fontSize: 15,
      //                 color: Colors.grey,
      //                 fontWeight: FontWeight.w900,
      //               ),
      //             ),
      //             const SizedBox(height: 15),
      //             const SizedBox(height: 15),
      //             Text(
      //               'Similar To This',
      //               style: GoogleFonts.poppins(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w600,
      //               ),
      //             ),
      //             const SizedBox(height: 10),
      //             BlocBuilder<ProductBloc, ProductState>(
      //               builder: (context, state) {
      //                 if (state is ProductLoading) {
      //                   return Center(child: CircularProgressIndicator());
      //                 }
      //                 if (state is ProductLoaded) {
      //                   return SizedBox(
      //                     height: 110,
      //                     child: ListView.builder(
      //                       scrollDirection: Axis.horizontal,
      //                       itemCount: state.products.length,
      //                       itemBuilder: (context, index) => Container(
      //                         margin: const EdgeInsets.only(right: 24),
      //                         width: 110,
      //                         height: 110,
      //                         decoration: BoxDecoration(
      //                           color: Colors.white,
      //                           borderRadius: BorderRadius.circular(20),
      //                           border: Border.all(color: Colors.black87)
      //                         ),
      //                         child: Center(
      //                           child: Image.network(product.imageUrls![0],
      //                               fit: BoxFit.fitHeight, width: 120.0),
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 } else {
      //                   return (const Text('Something Went Wrong'));
      //                 }
      //               },
      //             ),
      //           ]),
      //     ))
      //   ])
      // ]),
      bottomNavigationBar: BottomAppBar(
        //  color:  Color(0xFF4C53A5),
        child: Container(
          color: Colors.transparent,
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                )),
            BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
              if (state is WishlistLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              return IconButton(
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text('Added to Favourites!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    context
                        .read<WishlistBloc>()
                        .add(AddWishlistProduct(product));
                    Navigator.pushNamed(context, '/wishlist');
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ));
            }),
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4C53A5)),
                onPressed: () {
                  context.read<CartBloc>().add(AddProduct(product));
                  Navigator.pushNamed(context, '/cartPage');
                },
                child:  const Text('Add To Cart',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              );
            })
          ]),
        ),
      ),
    );
  }
}
