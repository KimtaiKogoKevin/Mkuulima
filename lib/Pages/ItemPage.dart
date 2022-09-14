import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';

import '../widgets/Item_app_bar.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back, size: 30, color: Color(0xFF4C53A5)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text('Product',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)))),
            Spacer(),
            Icon(Icons.favorite, size: 30, color: Colors.red)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //ItemAppBar(),

            Padding(
              padding: EdgeInsets.all(16),
              child: Image.asset("images/1.jpg", height: 400),
            ),
            Arc(
                edge: Edge.TOP,
                arcType: ArcType.CONVEY,
                height: 30,
                child: Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(children: [
                        Padding(
                            padding: EdgeInsets.only(
                              top: 50,
                              bottom: 20,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  "Product Title",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C53A5)),
                                )
                              ],
                            ))
                      ]),
                    ),
                  ),
                )),
            Container()

            // // ListView(
            // //   children: const [
            // //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
