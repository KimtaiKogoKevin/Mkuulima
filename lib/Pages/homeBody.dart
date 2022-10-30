import 'package:flutter/material.dart';
import 'package:mkuulima/models/Product.dart';

import '../widgets/bestSellers.dart';
import '../widgets/categories_widget.dart';
import '../widgets/category_carousel.dart';
import '../widgets/itemswidget.dart';
import '../widgets/search_widget.dart';
class HomeBody extends StatelessWidget {
  final List<Product> products;

  const HomeBody({
    Key? key,  required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children:[



        Container(
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
                  SearchBar(),

                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: const Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    ),
                  ),
                  //Categories
                  CategoryCarousel(),
                  BestSellers(),
                  BestSellers(),
                  BestSellers(),

                ],
              )


          // Container(
          //     margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          //     child: const HomeAppBar()),

      ),
  ])
    );
  }
}

