import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../models/Product.dart';
import '../../models/Product_model_base.dart';
import 'item_card.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key, required this.products ,required this.crossAxisCount}) : super(key: key);
  final List <Product> products;
  final int crossAxisCount;
  // final List <ProductBase> productBase;
  @override
  Widget build(BuildContext context) {

    return LayoutGrid(
      // set some flexible track sizes based on the crossAxisCount
      columnSizes: crossAxisCount == 2 ? [1.fr, 1.fr] : [1.fr],
      // set all the row sizes to auto (self-sizing height)
      rowSizes: crossAxisCount == 2
          ? const [auto, auto]
          : const [auto, auto, auto, auto],
      rowGap: 40, // equivalent to mainAxisSpacing
      columnGap: 24, // equivalent to crossAxisSpacing
      // note: there's no childAspectRatio
      children: [
        // render all the cards with *automatic child placement*
        for (var i = 0; i < products.length; i++)
          ItemCard(product: products[i]),
      ],
    );
    // return GridView.builder(
    //     gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
    //         childAspectRatio: MediaQuery.of(context).size.aspectRatio * 0.68,
    //         maxCrossAxisExtent: 200,
    //         // childAspectRatio: 3 / 2,
    //         crossAxisSpacing: 20,
    //         mainAxisSpacing: 20
    //
    //
    //
    //     ),
    //     itemCount: products.length,
    //     physics: const NeverScrollableScrollPhysics(),
    //     shrinkWrap: true,
    //     itemBuilder: (BuildContext context, index){
    //       return ItemCard(product: products[index],);
    //
    //     }
    //
    // );
  }
}
