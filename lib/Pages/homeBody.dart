import 'package:flutter/material.dart';
import 'package:mkuulima/models/Product.dart';
import 'package:mkuulima/responsive.dart';

import '../widgets/home/bestSellers.dart';

import '../widgets/categories/category_carousel.dart';
import '../widgets/Products/itemswidget.dart';
import '../widgets/search_widget.dart';

class HomeBody extends StatelessWidget {
  final List<Product> products;

  const HomeBody({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(shrinkWrap: true, children: [
      SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: Column(
              children: [

                //search widget
                const ResponsiveWidget(mobile:SearchBar(), tab: SearchBar(), desktop: SearchBar(),),


                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: const Text(
                    "Shop By Categories",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)),
                  ),
                ),
                //Categories
                const CategoryCarousel(),
                const BestSellers(),

              ],
            )


            ),
      ),
    ]));
  }
}
