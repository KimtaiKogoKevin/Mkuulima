import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0 ; i < 10; i++)
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color(0xFF4C54A5),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("50%",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 120,
                  width: 120,
                  child: Image.asset("images/1.jpg"),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.center,
                child: const Text(
                  "Fertilizer product",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF4C53A5)),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: const Text("Write description here"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "\$66",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                    Icon(Icons.shopping_cart_checkout)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
