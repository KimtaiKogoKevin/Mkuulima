import 'dart:convert';
import 'dart:typed_data';

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mkuulima/Database/database_services._base.dart';
import 'package:mkuulima/blocs/product/product_bloc.dart';
import 'package:mkuulima/models/Product_model_base.dart';
import 'package:mkuulima/widgets/categories/categoryCarouselItem.dart';
import 'package:provider/provider.dart';
import '../SQFlite/CartProvider.dart';
import '../SQFlite/DBHelper.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../config/ScreenArguments.dart';
import '../firebase_services.dart';
import '../models/CartDeprecated.dart';
import '../models/Product.dart';
import '../models/ProductDepracated.dart';
import '../repositories/database/database_service.dart';
import '../widgets/Products/ProductsScreen.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/homeappbar.dart';
import '../widgets/Products/itemBottomNavBar.dart';
import '../widgets/Products/item_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ItemPage_Base extends StatefulWidget {
     ItemPage_Base({Key? key, required this.product, }) : super(key: key);
    static const String routeName = '/itemPage_base';

   // static Route route({ required Product product, }) {
   //  return MaterialPageRoute(
   //      settings: const RouteSettings(name: routeName),
   //      builder: (_) => ItemPage_Base(
   //         product: product,
   //
   //
   //
   //      ));
  // }

  final Product product;
    // late int id ;



    // ProductBase productBase;



    @override
  State<ItemPage_Base> createState() => _ItemPage_BaseState();
}

class _ItemPage_BaseState extends State<ItemPage_Base> {
  DBHelper dbHelper = DBHelper();
  DatabaseServices_base service = DatabaseServices_base();
  Future<List<ProductBase>>? productList;
  List<ProductBase>? retrievedProductList;
  FirebaseService firebase = FirebaseService();

  @override
  void initState() {
    super.initState();
    _initRetrieval();



  }
  String uuid = Uuid().v4();

  void _generateNewUuid() {
    setState(() {
      uuid = Uuid().v4(); // Generate a new random UUID
    });
  }

  Future<void> _initRetrieval() async {
    productList = service.retrieveProducts();
    retrievedProductList = await service.retrieveProducts();
  }
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
   // final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    Uint8List convertStringToUint8List(String str) {
      final List<int> codeUnits = str.codeUnits;
      final Uint8List unit8List = Uint8List.fromList(codeUnits);

      return unit8List;
    }
    Future<String?> networkImageToBase64(String imageUrl) async {
      http.Response response = await http.get(Uri.parse(imageUrl));
      final bytes = response.bodyBytes;
      return (bytes != null ? base64Encode(bytes) : null);
    }



   Future<void> saveData(Product productBase) async{
      // image =convertStringToUint8List(productBase.imageUrls[0].replaceAll("'",''));
       final image = await networkImageToBase64(productBase.imageUrls[0]);


      // final imgBase64Str = await networkImageToBase64('IMAGE_URL');
      dbHelper
          .insert(
        CartDeprecated(
          id: uuid,
          userId: firebase.user?.uid,
          productId: productBase.productId,
          productName: productBase.productName,
          regularPrice: productBase.regularPrice,
         // discountPrice: productBase.discountPrice?.toInt(),
          quantity: ValueNotifier(1),

          //unitTag: products[index].unit,
          imageUrls:base64Decode(image!)
        ),
      )
          .then((value) {
        cart.addTotalPrice(widget.product.regularPrice.toDouble());
        print(uuid);

        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print("diddnt touch");
        print(uuid);
        print(error.toString());
      });}
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      appBar:  HomeAppBar(title: widget.product.productName),
      body: ProductScreen(product: widget.product,),
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
                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // context
                    //     .read<WishlistBloc>()
                    //     .add(AddWishlistProduct(widget.product ));
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
                onPressed: () async{

                  if (firebase.user?.uid!=null) {
                    await saveData(widget.product);
                    //context.read<CartBloc>().add(AddProduct(widget.product));
                    Navigator.pushNamed(context, '/cartscreen');
                  }
                  else {
                    Navigator.pushNamed(context, '/register');

                  }
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
