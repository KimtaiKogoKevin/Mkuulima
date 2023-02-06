import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../../../../models/Product.dart';
import '../../models/mainCategoryDepracated.dart';
import 'SubCategory.dart';

class MainCategoryWidget extends StatelessWidget {
  final String? selectedCat;


  const MainCategoryWidget({   this.selectedCat,Key? key}) : super(key: key);


   // final List<String> _categoryLabel = <String> [
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Material(
          child: FirestoreListView<MainCategoryDeprecated>(
            query: mainCategoriesCollection(selectedCat),

            itemBuilder: (context, snapshot) {
              MainCategoryDeprecated mainCategory = snapshot.data();
              return ExpansionTile(
                  title: Text(mainCategory.mainCategory!) ,
                  children: [SubCategoryWidget(selectedSubCat: mainCategory.mainCategory)]


              );
            },
          ),
        ));
  }
}