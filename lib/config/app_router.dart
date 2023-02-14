
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkuulima/Pages/ItemPage.dart';
import 'package:mkuulima/Pages/cartPage.dart';
import 'package:mkuulima/Pages/checkout.dart';
import 'package:mkuulima/models/mainCategoryDepracated.dart';
import 'package:mkuulima/splashView.dart';

import '../Pages/Authentication/login_page.dart';
import '../Pages/Authentication/register_page.dart';
import '../Pages/ItemPage_base.dart';
import '../Pages/Wishlist.dart';
import '../Pages/cartPageDeprecated.dart';
import '../Pages/checkout/CheckoutPage.dart';
import '../Pages/homepage.dart';
import '../main.dart';
import '../models/Category.dart';
import '../models/Product.dart';
import '../models/Product_model_base.dart';
import '../widgets/categories/category_screen.dart';
import '../widgets/categories/mainCategory.dart';


class AppRouter {


  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route:${settings.name}');

    switch (settings.name) {
      case '/':
        return HomePage.route(product: settings.arguments as Product);
      // case LoginPage.routeName:
      //   return LoginPage.route();
      case CartPage.routeName:
        return CartPage.route();
      case ItemPage.routeName:
        return ItemPage.route(product: settings.arguments as Product);
      // case ItemPage_Base.routeName:
      //   return ItemPage_Base.route(product:settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutPage.routeName:
        return CheckoutPage.route();

      case SplashView.routeName:
        return SplashView.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case RegisterPage.routeName:
        return RegisterPage.route();
      case BlocNavigate.routeName:
        return BlocNavigate.route();
      case CartScreen.routeName:
        return CartScreen.route();


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




