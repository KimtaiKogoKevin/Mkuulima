import 'package:flutter/material.dart';

import '../../../models/Product.dart';
import '../../models/Category.dart';
import 'category_screen.dart';
import 'mainCategory.dart';
import 'dart:developer' as dev;

class CategoryCarouselCard extends StatefulWidget {
  const CategoryCarouselCard({
    Key? key,
    this.category2,
    this.product2
  }) : super(key: key);
  final Category? category2;
  final Product ?product2;


  @override
  State<CategoryCarouselCard> createState() => _CategoryCarouselCardState();
}

class _CategoryCarouselCardState extends State<CategoryCarouselCard> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        setState(() {
          selectedCategory = widget.category2?.catName;
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {return const CategoryScreen();}),
        );

      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[

                // Image.network(product2==null ? category2!.image! : product2!.imageUrls.toString(),
                //     fit: BoxFit.cover, width: 1000.0),
                Image.network(widget.product2==null ? widget.category2!.image : widget.product2!.imageUrls![0],
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                        widget.product2 == null ? widget.category2!.catName : 'hkkjj',
                        style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white)
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}