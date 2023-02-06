import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mkuulima/utils/globalColors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  static const String routeName = '/Splash';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashView());
  }
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds:2),(){
      Navigator.pushNamed(context, '/');
    });
    return Scaffold(
      backgroundColor:GlobalColors.mainColor ,
      body: const Center(
        child: Text('MKUULIMA',style: TextStyle(
          color:Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),) ,

      )

    );
  }
}
