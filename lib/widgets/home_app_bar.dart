import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(children: [
        InkWell(
          onTap: (){},
          child: const Icon(
            Icons.sort,
            size: 30,
            color: Color(0xFF4C53A5),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("MkuuLima",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF4C53A5))),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, "cartPage");
          },
          child: Badge(
              badgeColor: Colors.red,
              padding: const EdgeInsets.all(7),
              badgeContent: const Text("3"),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 32,
                color: Color(0xFF4C53A5),
              )),
        ),
      ]),
    );
  }
}
