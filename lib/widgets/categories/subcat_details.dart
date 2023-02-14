import 'package:mkuulima/models/subCategoryDepracated.dart';
import 'package:flutter/material.dart';
import 'package:mkuulima/widgets/categories/productRow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../../blocs/product/product_bloc.dart';
import '../../blocs/product/subCatProducts/subcat_product_bloc.dart';
import '../../models/Product.dart';
import '../../models/ProductDepracated.dart';
import '../../models/Product_model_base.dart';
import '../homeappbar.dart';
class SubCatDetails extends StatefulWidget {
  const SubCatDetails({required this.subCategory, Key? key, required this.subCatSelected}) : super(key: key);
  final SubCategoryDeprecated subCategory;
  final String subCatSelected;



  @override
  _SubCatDetailsState createState() => _SubCatDetailsState();
}

enum Filters { popular, recent, sale }

class _SubCatDetailsState extends State<SubCatDetails> {
  SubCategoryDeprecated get subCategory => widget.subCategory;
  Filters filterValue = Filters.popular;
  String? selection;
   late List<Product> _products;

  @override
  void initState() {
   // selection = category.selections.first;
   // _products = products.where((p) => p.category == category).toList();
    super.initState(

    )
    ;
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
      appBar:HomeAppBar(title:subCategory.subCatName),
      body: BlocBuilder<ProductSubCatBloc,ProductSubCatState>(

        builder: (context,state) {
          if (state is ProductSubCatLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is ProductSubCatLoaded){
            return ListView.separated(

              padding: const EdgeInsets.symmetric(vertical: 18),
              itemCount: state.products.length,

              itemBuilder: (  context, index) {
                return ProductRow(products:_products, productSubCat: widget.subCatSelected, );
              },
              separatorBuilder: (_, index) => const SizedBox(
                height: 18,
              ),
            );

          }
          else {
            return const Text('Something Went Wrong');

          }
        }
      ));



        }


  }
