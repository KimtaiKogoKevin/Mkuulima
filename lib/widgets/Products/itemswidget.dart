import 'package:flutter/material.dart';

import '../../models/Product.dart';
import 'item_card.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key, required this.products}) : super(key: key);
  final List <Product> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 0.68,
          maxCrossAxisExtent: 200,
         // childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20



      ),
      itemCount: products.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index){
        return ItemCard(product: products[index]);

      }

    );
  }
}

