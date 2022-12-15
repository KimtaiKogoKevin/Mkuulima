import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mkuulima/widgets/custom_app_bar.dart';
import 'package:mkuulima/widgets/itemswidget.dart';
import 'package:badges/badges.dart';
import '../models/Product.dart';
import '../widgets/categories/categories_widget.dart';
import '../widgets/categories/category_screen.dart';
import '../widgets/search_widget.dart';
import 'homeBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/';
  static Page<void> page() => const MaterialPage<void>(child: HomePage());

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
        appBar: const HomeAppBar(title: "Mukuu-Lima"),
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

