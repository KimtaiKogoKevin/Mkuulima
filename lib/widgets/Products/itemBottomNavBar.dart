import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("KSH 120",
                  style: (TextStyle(
                      fontSize: 25,
                      color: Color(0xFF4C53A5),
                      fontWeight: FontWeight.bold))),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.cart_badge_plus),
                  label: const Text("Add To Cart",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF4C53A5)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 13, horizontal: 15)),
                      shape:MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )))),
            ],
          ),
        ));
  }
}
