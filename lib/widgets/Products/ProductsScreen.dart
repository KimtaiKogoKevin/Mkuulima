import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';



import '../../Database/database_services._base.dart';
import '../../SQFlite/CartProvider.dart';
import '../../SQFlite/DBHelper.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/wishlist/wishlist_bloc.dart';
import '../../firebase_services.dart';
import '../../models/CartDeprecated.dart';
import '../../models/Product.dart';
import 'package:flutter/material.dart';
import '../../models/Product_model_base.dart';
import '../../responsive.dart';
import'../../utils/globalColors.dart';
import '../homeappbar.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.product, Key? key}) : super(key: key);
  final Product product;



  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;
  Future<List<ProductBase>>? productList;
  List<ProductBase>? retrievedProductList;
  FirebaseService firebase = FirebaseService();
  DBHelper dbHelper = DBHelper();
  DatabaseServices_base service = DatabaseServices_base();

  @override
  void initState() {
    selectedImageUrl = product.imageUrls[0];
    //selectedSize = product.sizes?.first;
    super.initState();
    _initRetrieval();

  }
  String uuid = Uuid().v4();


  Future<void> _initRetrieval() async {
    productList = service.retrieveProducts();
    retrievedProductList = await service.retrieveProducts();
  }


  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    List<Widget> imagePreviews = product.imageUrls.map(
          (url) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () => setSelectedImageUrl(url),
          child: Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white,
              border: selectedImageUrl == url
                  ? Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 1.75)
                  : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              url,
            ),
          ),
        ),
      ),
    )
        .toList();

    // List<Widget> sizeSelectionWidgets = product.sizes
    //     ?.map(
    //       (s) => Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
    //     child: GestureDetector(
    //       onTap: () {
    //         setSelectedSize(s);
    //       },
    //       child: Container(
    //         height: 42,
    //         width: 38,
    //         decoration: BoxDecoration(
    //           color: selectedSize == s
    //               ? Theme.of(context).colorScheme.secondary
    //               : null,
    //           border: Border.all(
    //             color: Colors.grey[350]!,
    //             width: 1.25,
    //           ),
    //           borderRadius: BorderRadius.circular(8),
    //         ),
    //         child: Center(
    //           child: Text(
    //             s,
    //             style: Theme.of(context).textTheme.caption!.copyWith(
    //                 color: selectedSize == s ? Colors.white : null),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // )
    //     .toList() ??
    //     [];

    // Future<String?> networkImageToBase64(String imageUrl) async {
    //   http.Response response = await http.get(Uri.parse(imageUrl));
    //   final bytes = response.bodyBytes;
    //   return (bytes != null ? base64Encode(bytes) : null);
    // }

    // Future<String?> networkImageToBase64(String imageUrl) async {
    //   http.Response response = await http.get(Uri.parse(imageUrl));
    //   final bytes = response.bodyBytes;
    //   return (bytes != null ? base64Encode(bytes) : null);
    // }


    // Future<void> saveData(Product productBase) async{
    //   // image =convertStringToUint8List(productBase.imageUrls[0].replaceAll("'",''));
    //   final image = await networkImageToBase64(productBase.imageUrls[0]);
    //
    //
    //   // final imgBase64Str = await networkImageToBase64('IMAGE_URL');
    //   dbHelper
    //       .insert(
    //     CartDeprecated(
    //         id: uuid,
    //         userId: firebase.user?.uid,
    //         productId: productBase.productId,
    //         productName: productBase.productName,
    //         regularPrice: productBase.regularPrice,
    //         // discountPrice: productBase.discountPrice?.toInt(),
    //         quantity: ValueNotifier(1),
    //
    //         //unitTag: products[index].unit,
    //         imageUrls:base64Decode(image!)
    //     ),
    //   )
    //       .then((value) {
    //     cart.addSubTotalPrice(widget.product.regularPrice.toDouble());
    //     print(uuid);
    //
    //     cart.addCounter();
    //     print('Product Added to cart');
    //   }).onError((error, stackTrace) {
    //     print("diddnt touch");
    //     print(uuid);
    //     print(error.toString());
    //   });}


    return Scaffold(
    //  appBar: HomeAppBar(title:product.productName),
      body: ResponsiveWidget(
        mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .35,
              color: GlobalColors.kGreyBackground,
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      selectedImageUrl!,
                      fit: BoxFit.cover,
                      color: GlobalColors.kGreyBackground,
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagePreviews,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "\$" + product.regularPrice.toString(),
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      product.productDescription ??
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis purus laoreet, efficitur libero vel, feugiat ante. Vestibulum tempor, ligula.",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(height: 1.5),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    // if (sizeSelectionWidgets.isNotEmpty) ...[
                    //   Text(
                    //     "Size",
                    //     style: Theme.of(context).textTheme.subtitle2,
                    //   ),
                    //   const SizedBox(height: 8),
                    //   Row(
                    //     children: sizeSelectionWidgets,
                    //   ),
                    // ],
                    const Spacer(),
                    const Center(
                      // child: CallToActionButton(
                      //   onPressed: () => cart.add(
                      //     OrderItem(
                      //       product: product,
                      //       selectedSize: selectedSize,
                      //     ),
                      //   ),
                      //   labelText: "Add to Cart",
                      // ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        desktop:
        Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .65,
              width: MediaQuery.of(context).size.height * .65,

              color: GlobalColors.kGreyBackground,
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      selectedImageUrl!,
                      fit: BoxFit.cover,
                      color: GlobalColors.kGreyBackground,
                      colorBlendMode: BlendMode.multiply,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imagePreviews,
                  ),
                ],
              ),
            ),
            Text('Product Name Here',style: GoogleFonts.caveat(fontSize:48).copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),)
          ],

        ),
        tab:
        Row(

          children: [
            Container(

                height: MediaQuery.of(context).size.height * .65,
                width: MediaQuery.of(context).size.height * .65,

                color: GlobalColors.kGreyBackground,
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        selectedImageUrl!,
                        fit: BoxFit.cover,
                        color: GlobalColors.kGreyBackground,
                        colorBlendMode: BlendMode.multiply,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imagePreviews,
                    ),
                  ],
                ),
              ),
            const SizedBox(width:50),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),

                  Padding(
                    padding: const EdgeInsets.only(left:22.0),

                    child: Text('Product Name Here',style: GoogleFonts.caveat(fontSize:38).copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),),
                  ),
                  const SizedBox(height: 160,),
                  Text('Details',style: GoogleFonts.bebasNeue(fontSize:28).copyWith(
                    color: Colors.black
                  ),),
                   const SizedBox(height: 18,),



                  Wrap(
                    children: [
                      Text('Description of details :',style: GoogleFonts.bebasNeue(fontSize:18).copyWith(
                          color: Colors.black
                      ),),
                      const SizedBox(width: 5,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Lorem ipsum dolor sit amet, \n consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n  Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',style: GoogleFonts.bebasNeue(fontSize:15).copyWith(
                            color: Colors.black
                        ),),
                      ),
                    ],
                  ),
                  const SizedBox(height:50),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey,width: 5),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text('Price: Ksh 600 :',style: GoogleFonts.bebasNeue(fontSize:18).copyWith(
                                color: Colors.black
                            ),),
                          ),
                          const SizedBox(height:40),
                          BlocBuilder<CartBloc, CartState>(builder: (context, state) {

                            return Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4C53A5)),
                                onPressed: () async{

                                  if (firebase.user?.uid!=null) {

                                    // await saveData(widget.product);
                                    context.read<CartBloc>().add(AddProduct(widget.product));
                                    Navigator.pushNamed(context, '/cartPage');
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
                              ),
                            );
                          })

                        ],

                      ),
                    ),
                  )



                ],
              ),
            ),
            const SizedBox(width:40),


          ],

        ),

      ),

    );
  }
}