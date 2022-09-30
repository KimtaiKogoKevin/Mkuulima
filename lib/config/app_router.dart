
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkuulima/Pages/ItemPage.dart';
import 'package:mkuulima/Pages/cartPage.dart';
import 'package:mkuulima/Pages/checkout.dart';

import '../Pages/homepage.dart';
import '../models/Product.dart';

class AppRouter {

  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route:${settings.name}');

    switch (settings.name) {
      case '/':
        return HomePage.route();
      // case LoginPage.routeName:
      //   return LoginPage.route();
      case CartPage.routeName:
        return CartPage.route();
      case ItemPage.routeName:
        return ItemPage.route(product: settings.arguments as Product);
      // case WishlistScreen.routeName:
      //   return WishlistScreen.route();
      case CheckOutPage.routeName:
        return CheckOutPage.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(appBar: AppBar(title: const Text('Error'))));
  }
}