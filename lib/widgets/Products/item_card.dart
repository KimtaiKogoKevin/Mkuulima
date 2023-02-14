import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mkuulima/Pages/ItemPage_base.dart';
import 'package:mkuulima/widgets/Products/ProductsScreen.dart';

import '../../models/Product.dart';
import '../../models/Product_model_base.dart';
class ItemCard extends StatelessWidget {
  final Product product;
  // final ProductBase productBase;
// final int index;
  const ItemCard({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       // Navigator.pushNamed(context, '/productScreen', arguments: product);
        Navigator.push(context,MaterialPageRoute(builder:(context)=>ProductScreen(product: product)));

      },
      child: Container(

        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(

                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color(0xFF4C54A5),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("50%",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>ItemPage_Base(product: product, )));

              //  Navigator.pushNamed(context, '/itemPage_base', arguments: Product(productName: product.productName, subCategory: product.subCategory, imageUrls: product.imageUrls, regularPrice: product.regularPrice) , );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 110,
                width: 100,
                child: Image.network(product.imageUrls![0]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              alignment: Alignment.center,
              child:  Text(
                  product.brandName.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF4C53A5)),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child:  Text(product.productDescription.toString()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text(
                    '\KSH ${product.regularPrice}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                  Icon(Icons.shopping_cart_checkout)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar.builder(
                    initialRating: 4,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 20,
                    itemPadding:
                    const EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Color(0xFF4C53A5),
                    ),
                    onRatingUpdate: (index) {},
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
