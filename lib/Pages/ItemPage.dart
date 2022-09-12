import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';

import '../widgets/Item_app_bar.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back, size: 30, color: Color(0xFF4C53A5)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [

            const Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text('Product',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)))),
            Spacer(),
            const Icon(Icons.favorite, size: 30, color: Colors.red)
          ],
        ),
      ),
      body: Column(
        children: [
          //ItemAppBar(),

          Padding(
            padding:EdgeInsets.all(16),
            child: Image.asset("images/1.jpg", height:400),
          ),
       Arc(
         edge: Edge.TOP,
         arcType: ArcType.CONVEX,
         height:30,
         child:Expanded(
           child: Container(
             height: 60,
             width:double.infinity,
             color:Color(0xFFEDECF2),
             child: const Padding(
               padding: EdgeInsets.symmetric(horizontal:30),

             ),
           ),
         )


       ),
          Container()

          // // ListView(
          // //   children: const [
          // //   ],
          // ),
        ],
      ),
      );


  }
}
