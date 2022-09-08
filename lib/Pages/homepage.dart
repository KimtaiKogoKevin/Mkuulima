import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mkuulima/widgets/home_app_bar.dart';
import 'package:mkuulima/widgets/itemswidget.dart';

import '../widgets/categories_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HomeAppBar(),
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search here ..."),
                          ),
                        ),
                        const Icon(Icons.camera_alt),

                      ],
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: const Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5)),
                    ),
                  ),
                  //Categories
                   CategoriesWidget(),

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
                  ItemsWidget()
                ],
              ))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[

          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.shopping_bag_outlined, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
        backgroundColor:Colors.transparent,
      ),
    );
  }
}
