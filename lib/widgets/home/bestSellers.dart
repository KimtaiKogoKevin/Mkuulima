import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product/product_bloc.dart';
import '../../models/Product.dart';
import '../Products/itemswidget.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(  // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(

    children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: const Text(
            "Best Sellers",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5)),
          ),
        ),
        BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductLoaded) {
            return ItemsWidget(
              crossAxisCount: 2,
                products: state.products
                    .where((product) => product.isRecommended!)
                    .toList());
          } else {
            return const Text('Something Went Wrong');
          }
        })
      ],
    );
  }
}
