import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mkuulima/widgets/categories/categoryCarouselItem.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/Product.dart';
import '../widgets/Item_app_bar.dart';
import '../widgets/itemBottomNavBar.dart';
import '../widgets/item_card.dart';

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
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);

          },
          child:
              const Icon(Icons.arrow_back, size: 30, color: Color(0xFF4C53A5)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text('Product',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)))),
            Spacer(),
            Icon(Icons.favorite, size: 30, color: Colors.red)
          ],
        ),
      ),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: [CategoryCarouselCard(product2: product)],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(children: [
              Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  //color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all( 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            ' ${product.productName}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: const Color(0xFF4C53A5)),
                          ),
                        ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        Expanded(
                            child: Text(' KSH ${product.regularPrice} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: const Color(0xFF4C53A5))))
                      ],
                    ),
                  ))
            ])),
        ExpansionTile(
          title: const Text(
            'Product Description',
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
          children: [
            ListTile(
              enabled: true
              ,
              title: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in consectetur nisi, vel fringilla dui. Aenean gravida, risus id iaculis semper, arcu erat imperdiet tellus, nec vestibulum sapien nibh vel odio. Cras lobortis varius tortor, placerat laoreet orci rhoncus a. Proin id nulla dignissim eros commodo malesuada. Fusce in neque congue, imperdiet ipsum et, ultrices massa. Mauris sit amet interdum risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In venenatis, nisl et tempor fermentum, enim nunc semper neque, vitae euismod lorem lacus eget nunc. Aenean suscipit neque et erat semper gravida. Praesent quis nisi quis turpis ornare commodo. Curabitur mattis posuere turpis et mollis. Vivamus sed lectus sit amet eros mollis elementum. Cras in semper massa. Fusce nec ullamcorper tellus. Quisque consectetur dui vel tristique egestas.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            'Delivery Details',
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
          children: [
            ListTile(
              title: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in consectetur nisi, vel fringilla dui. Aenean gravida, risus id iaculis semper, arcu erat imperdiet tellus, nec vestibulum sapien nibh vel odio. Cras lobortis varius tortor, placerat laoreet orci rhoncus a. Proin id nulla dignissim eros commodo malesuada. Fusce in neque congue, imperdiet ipsum et, ultrices massa. Mauris sit amet interdum risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In venenatis, nisl et tempor fermentum, enim nunc semper neque, vitae euismod lorem lacus eget nunc. Aenean suscipit neque et erat semper gravida. Praesent quis nisi quis turpis ornare commodo. Curabitur mattis posuere turpis et mollis. Vivamus sed lectus sit amet eros mollis elementum. Cras in semper massa. Fusce nec ullamcorper tellus. Quisque consectetur dui vel tristique egestas.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        )
      ]),
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
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white),
                onPressed: () {
                  context.read<CartBloc>().add(AddProduct(product));
                  Navigator.pushNamed(context, '/cartPage');
                },
                child: const Text('Add To Cart',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5))),
              );
            })
          ]),
        ),
      ),
    );
  }
}
