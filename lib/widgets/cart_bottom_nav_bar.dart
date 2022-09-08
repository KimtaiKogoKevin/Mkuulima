import 'package:flutter/material.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5))),
                Text(
                  "Sh 560",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5)),
                )
              ],
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              width: double.infinity,
               decoration: BoxDecoration(color: const Color(0xFF4C53A5),
              borderRadius: BorderRadius.circular(5)),
            child: const Text("Check Out",style:  TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
