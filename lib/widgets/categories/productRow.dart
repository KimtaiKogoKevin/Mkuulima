import '../../models/Product.dart';
import 'package:flutter/material.dart';

import '../Products/productTile.dart';

class ProductRow extends StatelessWidget {
  const ProductRow(
      { this.products, required this.productSubCat, Key? key})
      : super(key: key);
  final String productSubCat;
  final List <Product>? products;

  @override
  Widget build(BuildContext context) {
    // List<ProductTile> productTiles =
    // products.map((p) => ProductTile(product: p)).toList();

    // return productTiles.isEmpty
    //     ? const SizedBox.shrink():
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Text(
            productSubCat,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 205,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            itemCount: products?.length ?? 0 ,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {return ProductTile(product:products![index]);},
            separatorBuilder: (_, index) => const SizedBox(
              width: 24,
            ),
          ),
        ),
      ],
    );
  }
}