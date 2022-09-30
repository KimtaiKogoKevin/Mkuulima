import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/Product.dart';
import '../widgets/Item_app_bar.dart';
import '../widgets/itemBottomNavBar.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key, required Product product , }) : super(key: key);
  static const String routeName = '/itemPage';

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ItemPage(product:product));
  }

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDECF2),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child:
              const Icon(Icons.arrow_back, size: 30, color: Color(0xFF4C53A5)),
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
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //ItemAppBar(),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset("images/1.jpg", height: 400 , fit:BoxFit.fill),
            ),
            Arc(
                edge: Edge.TOP,
                arcType: ArcType.CONVEY,
                height: 30,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.only(
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
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Color(0xFF4C53A5),
                              ),
                              onRatingUpdate: (index) {},
                            ),
                            Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: Offset(0, 3))
                                        ]),
                                    child: const Icon(
                                      CupertinoIcons.minus,
                                      size: 18,
                                    )),
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: const Text("01",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF4C53A5)))),
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: Offset(0, 3))
                                        ]),
                                    child: const Icon(
                                      CupertinoIcons.plus,
                                      size: 16,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                            "This is more detailed Product Description section",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF4C53A5))),
                      ),

                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(children: [
                            const Text("Size:",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF4C53A5),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Row(
                              children: [
                                for (int i = 5; i < 10; i++)
                                  Container(
                                      height: 30,
                                      width: 30,
                                      alignment: Alignment.center,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey
                                                  .withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 8,
                                            )
                                          ]),
                                      child: Text(
                                        i.toString(),
                                        style: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF4C53A5),
                                            fontWeight: FontWeight.bold),
                                      ))
                              ],
                            )
                          ]))
                    ]),
                  ),
                )),

          ],
        ),

      ),
      bottomNavigationBar: ItemBottomNavBar(),
    );
  }
}
