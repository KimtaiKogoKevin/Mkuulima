import 'package:flutter/material.dart';

import '../models/Product.dart';
import 'item_card.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key, required this.products}) : super(key: key);
  final List <Product> products;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0 ; i < 10; i++)
        ItemCard(product: products[i],)
      ],
    );
  }
}

