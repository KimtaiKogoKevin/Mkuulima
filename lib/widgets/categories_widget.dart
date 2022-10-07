import 'package:flutter/material.dart';
import 'package:mkuulima/models/Category.dart';
import 'package:flutterfire_ui/firestore.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreListView<Category>(
      query: categoriesCollection,
      itemBuilder: (context,snapshot){
        Category category = snapshot.data();
        return       Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/1.jpg",
                  width: 40,
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Fertilizer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                )
              ],
            ),
          )
        ]);

      },
      scrollDirection: Axis.horizontal,
    );
  }
}
