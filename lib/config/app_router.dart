
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mkuulima/Pages/ItemPage.dart';
import 'package:mkuulima/Pages/cartPage.dart';
import 'package:mkuulima/Pages/checkout.dart';
import 'package:mkuulima/splashView.dart';

import '../Pages/Authentication/login_page.dart';
import '../Pages/Authentication/register_page.dart';
import '../Pages/Wishlist.dart';
import '../Pages/homepage.dart';
import '../blocs/auth/auth_bloc.dart';
import '../models/Product.dart';
import '../widgets/categories/category_screen.dart';

 List <Page> onGenerateAppViewPages(
AuthStatus state,
    List <Page<dynamic>> pages,
){
switch (state){
case AuthStatus.authenticated:
return [HomePage.page()];
case AuthStatus.unauthenticated:
return [LoginPage.page()];
}
}
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
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckOutPage.routeName:
        return CheckOutPage.route();
      case SplashView.routeName:
        return SplashView.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case RegisterPage.routeName:
        return RegisterPage.route();
      case CategoryScreen.routeName:
        return CategoryScreen.route();

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
