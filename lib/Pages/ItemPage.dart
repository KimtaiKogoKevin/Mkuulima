import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';

import '../widgets/Item_app_bar.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ItemAppBar(),
          Padding(
            padding:EdgeInsets.all(16),
            child: Image.asset("images/1.png", height:400),
          ),
       Arc(
         edge: Edge.TOP,
         arcType: ArcType.CONVEX,
         height:30,
         child:Container(
           width:double.infinity,
           color:Colors.white,
           child: const Padding(
             padding: EdgeInsets.symmetric(horizontal:30),

           ),
         )


       ),

          ListView(
            children: const [
            ],
          ),
        ],
      ),
      );


  }
}
