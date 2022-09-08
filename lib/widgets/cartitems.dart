import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemSamples extends StatelessWidget {
  const CartItemSamples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

    children: [
      for (int i=0 ; i<3; i++)

        Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Row(
            children: [
              Radio(
                value: "",
                groupValue: "",
                activeColor: const Color(0xFF4C53A5),
                onChanged: (index) {},
              ),
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset("images/1.jpg"),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Product Title',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5))),
                      Text('KSh 100',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C53A5))),
                    ],
                  )),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  )
                                ]),
                        child: const Icon(CupertinoIcons.plus,
                        size:18),),
                        Container(
                          margin:const EdgeInsets.symmetric(horizontal: 5),
                          child:const Text( "01",
                            style:TextStyle(fontSize: 16 , fontWeight: FontWeight.bold,color: Color(0xFF4C53A5)),

                          )
                        ),

                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                )
                              ]),
                          child: const Icon(CupertinoIcons.minus,
                              size:18),),

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
