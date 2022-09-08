import 'package:flutter/material.dart';

import '../widgets/cart_app_bar.dart';
import '../widgets/cartitems.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          const CartAppBar(),
          Container(
            height:700,
            padding:const EdgeInsets.only(top:15),
            decoration:const BoxDecoration(
              color:Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft:Radius.circular(35),
              topRight:Radius.circular(35),

            ),


            ),
              child:Column(children: [
                const CartItemSamples(),
                Container(
                  //decoration:BoxDecoration(
                  // borderRadius:BorderRadius.circular(10),
                //),
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    Container(decoration: BoxDecoration(
                      color:Color
                    ),)
                  ],),
                )
              ])

          )
        ]
      ),
    );
  }
}
