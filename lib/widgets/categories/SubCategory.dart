import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:mkuulima/widgets/categories/subcat_details.dart';

import '../../models/Product.dart';
import '../../models/subCategoryDepracated.dart';

class SubCategoryWidget extends StatefulWidget {
   String? selectedSubCat='';
  final Product? product;

   SubCategoryWidget({this.product, this.selectedSubCat, Key? key})
      : super(key: key);

  @override
  State<SubCategoryWidget> createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  void _pushScreen({required BuildContext context, required Widget screen}) {
    ThemeData themeData = Theme.of(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Theme(data: themeData, child: screen),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(children: <Widget>[
        Expanded(
            child: FirestoreQueryBuilder<SubCategoryDeprecated>(
                query: subCategoriesCollection(
                    subCatSelected: widget.selectedSubCat),
                builder: (context, snapshot, _) {
                  if (snapshot.isFetching) {
                    // print(selectedSubCat);

                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Text('error ${snapshot.error}');
                  }
                  print(snapshot.docs.length);
                  if (snapshot.docs.isEmpty) {
                    print('empty');
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio:
                            snapshot.docs.isEmpty ? 1 / .1 : 1 / 1.1),
                    shrinkWrap: true,
                    itemCount: snapshot.docs.length,
                    itemBuilder: (context, index) {
                      final subCat = snapshot.docs[index].data();

                      // if we reached the end of the currently obtained items, we try to
                      // obtain more items
                      if (snapshot.hasMore &&
                          index + 1 == snapshot.docs.length) {
                        // Tell FirestoreQueryBuilder to try to obtain more items.
                        // It is safe to call this function from within the build method.
                        snapshot.fetchMore();
                      }

                      return Column(children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                               widget.selectedSubCat= widget.selectedSubCat;
                            });
                            _pushScreen(
                                context: context,
                                screen: SubCatDetails(
                                  subCategory: subCat,
                                 // selectedSubCat:widget.selectedSubCat,
                                ));
                          },
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: CachedNetworkImage(
                                imageUrl: subCat.image!,
                                placeholder: (context, _) {
                                  return Container(
                                    height: 60,
                                    width: 60,
                                    color: Colors.grey.shade300,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Text(
                          subCat.subCatName!,
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        )
                      ]);
                    },
                  );
                })),
      ]),
    );
  }
}
