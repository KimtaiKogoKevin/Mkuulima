import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../../blocs/category/category_bloc.dart';
import '../../models/Category.dart';
import '../../models/CategoryDepracated.dart';
import '../../models/mainCategoryDepracated.dart';
import 'SubCategory.dart';
import 'mainCategory.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  // static const String routeName = '/categories-screen';
  //
  //
  // static Route route() {
  //   return MaterialPageRoute(
  //       settings: const RouteSettings(name: routeName),
  //       builder: (_) => CategoryScreen(
  //
  //       ));
  // }
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String title = 'Categories';
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? title : selectedCategory!,
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: BlocBuilder<CategoryBloc,CategoryState>(
        builder: (context,state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategoryLoaded) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [


                Container(
                  width: 80,
                  color: Colors.grey.shade300,
                  child: FirestoreListView<CategoryDeprecated>(

                    query: categoriesCollection,
                    itemBuilder: (context, snapshot) {
                      CategoryDeprecated category = snapshot.data();
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedCategory = category.catName;
                          });
                        },
                        child: Container(
                            height: 70,
                            color: selectedCategory == category.catName
                                ? Colors.white
                                : Colors.grey.shade300,
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                  Column(mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                            height: 30,
                                            child: CachedNetworkImage(
                                              imageUrl: category.image!,
                                              color: selectedCategory ==
                                                  category.catName
                                                  ? Theme
                                                  .of(context)
                                                  .primaryColor
                                                  : Colors.grey.shade700,
                                            )),
                                        Text(
                                          category.catName!,
                                          style: TextStyle(
                                            fontSize: 8,
                                            color: selectedCategory ==
                                                category.catName
                                                ? Theme
                                                .of(context)
                                                .primaryColor
                                                : Colors.grey.shade700,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ]),
                                ))),
                      );
                    },
                  ),
                ),



                MainCategoryWidget(
                  selectedCat: selectedCategory,
                )
              ],
            );
          }
          else {
            return (const Text('Something went wrong '));
          }
        }
      )
    );
  }
}