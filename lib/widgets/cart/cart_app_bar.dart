import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget with PreferredSizeWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);

          },
          child:
          const Icon(Icons.arrow_back, size: 30, color: Color(0xFF4C53A5)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Padding(
                padding: EdgeInsets.only(left: 0),
                child: Text('Your Cart',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5)))),
            Spacer(),
            Icon(Icons.person, size: 30, color: Colors.black87)
          ],
        ),
      );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
