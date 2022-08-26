import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all( 25),
      child: Row(children: [
        const Icon(
          Icons.sort,
          size: 30,
          color: Color(0xFF4C53A5),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text("MkuuLima",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5))),
        ),
        const Spacer(),
        Badge(
          badgeColor: Colors.red,
          padding: EdgeInsets.all(7),
          badgeContent: Text("3"),
          child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 32,
                color: Color(0xFF4C53A5),
              )),
        )
      ]),
    );
  }
}
