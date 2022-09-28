import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkuulima/Pages/homepage.dart';
import 'package:bloc/bloc.dart';
import 'Pages/ItemPage.dart';
import 'Pages/cartPage.dart';
import 'Pages/checkout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        routes: {
          "/":(context) => const HomePage(),
          "cartPage":(context) => const CartPage(),
          "itemPage":(context) => const ItemPage(),
          "checkOut":(context) => const CheckOut(),

        },
      ),
    );
  }
}
