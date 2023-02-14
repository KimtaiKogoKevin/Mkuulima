import 'package:flutter/material.dart';

import '../../models/Product.dart';
import '../../models/Product_model_base.dart';
import '../../utils/globalColors.dart';
class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .95,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: GlobalColors.kGreyBackground,
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          product.imageUrls[0],
          loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
              ? child
              : const Center(child: CircularProgressIndicator()),
          color: GlobalColors.kGreyBackground,
          colorBlendMode: BlendMode.multiply,
        ),
      ),
    );
  }
}