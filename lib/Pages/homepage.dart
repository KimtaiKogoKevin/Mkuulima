import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mkuulima/widgets/home_app_bar.dart';
import 'package:mkuulima/widgets/itemswidget.dart';

import '../widgets/categories_widget.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('MkuuLima',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF4C53A5))),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'cartPage');
                  },
                  child: Icon(Icons.shopping_bag_outlined,
                      size: 30, color: Color(0xFF4C53A5)))
            ],
          ),
          bottom: const TabBar(
            indicatorColor: Color(0xFF4C53A5),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home, size: 30, color: Color(0xFF4C53A5)),
              ),
              Tab(
                icon: Icon(Icons.list, size: 30, color: Color(0xFF4C53A5)),
              ),
              Tab(
                icon: Icon(Icons.person, size: 30, color: Color(0xFF4C53A5)),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // Container(
                      //     margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      //     child: const HomeAppBar()),
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
                              CategoriesWidget(),

                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                child: const Text(
                                  "Best Sellers",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5)),
                                ),
                              ),
                              ItemsWidget(products: [],)
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
        ]),
        // bottomNavigationBar: CurvedNavigationBar(
        //   items: <Widget>[
        //     Icon(Icons.home, size: 30),
        //     Icon(Icons.list, size: 30),
        //     Icon(Icons.shopping_bag_outlined, size: 30),
        //   ],
        //   onTap: (index) {
        //     //Handle button tap
        //   },
        //   backgroundColor: const Color(0xFF4C53A5),
        // ),
      ),
    );
  }
}
