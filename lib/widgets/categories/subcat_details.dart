import 'package:mkuulima/models/subCategoryDepracated.dart';
import 'package:flutter/material.dart';
import 'package:mkuulima/widgets/categories/productRow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product/product_bloc.dart';
import '../../blocs/product/subCatProducts/subcat_product_bloc.dart';
import '../../models/Product.dart';
class SubCatDetails extends StatefulWidget {
  const SubCatDetails({required this.subCategory, Key? key,}) : super(key: key);
  final SubCategoryDeprecated subCategory;


  @override
  _SubCatDetailsState createState() => _SubCatDetailsState();
}

enum Filters { popular, recent, sale }

class _SubCatDetailsState extends State<SubCatDetails> {
  SubCategoryDeprecated get subCategory => widget.subCategory;
  Filters filterValue = Filters.popular;
  String? selection;

  // List<Product> _products;

  @override
  void initState() {
   // selection = category.selections.first;
  //  _products = products.where((p) => p.category == category).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<ProductRow> productRows = category.selections
    //     .map((s) => ProductRow(
    //   productType: s,
    //   products: _products
    //       .where((p) => p.productName.toLowerCase() == s.toLowerCase())
    //       .toList(),
    // ))
    //     .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(subCategory.subCatName),
        actions: const [
        //  CartAppBarAction(),
        ],
      ),
      body: BlocBuilder<ProductSubCatBloc,ProductSubCatState>(
        builder: (context,state) {
          if(state is ProductSubCatLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is ProductSubCatLoaded){
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 18),
              itemCount: state.products.length,

              itemBuilder: (BuildContext context, index) {
                return ProductRow(products: state.products, productSubCat: '', );
              },
              separatorBuilder: (_, index) => const SizedBox(
                height: 18,
              ),
            );

          }
          else {
            return (const Text('Something went wrongs '));
          }
        }
      ),
    );
  }
}