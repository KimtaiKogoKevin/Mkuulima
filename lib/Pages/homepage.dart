import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mkuulima/widgets/home_app_bar.dart';
import 'package:mkuulima/widgets/itemswidget.dart';

import '../models/Product.dart';
import '../widgets/category/categories_widget.dart';
import '../widgets/category/category_screen.dart';
import '../widgets/search_widget.dart';
import 'homeBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Route route({ required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => HomePage());
  }
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
                HomeBody(products: [],),
              ],
            ),
          ),

         Container(
           margin:EdgeInsets.only(top:20),
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

           child:  CategoryScreen(),
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

