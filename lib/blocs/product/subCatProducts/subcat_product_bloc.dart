import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkuulima/models/subCategoryDepracated.dart';
import '../../../models/Product.dart';
import '../../../repositories/products/product_subcat.repository.dart';
import 'package:equatable/equatable.dart';


part 'subcat_product_event.dart';
part 'subcat_product_state.dart';

class ProductSubCatBloc extends Bloc<ProductSubCatEvent, ProductSubCatState> {
  final ProductSubCatRepository _productsubCatRepository;

  StreamSubscription? _productSubCatSubscription;


  ProductSubCatBloc(  {  required ProductSubCatRepository productSubCatRepository})
      : _productsubCatRepository = productSubCatRepository,
        super(ProductSubCatLoading()) {
    on<LoadSubCatProducts>(_onLoadSubCatProducts);
    on<UpdateSubCatProducts>(_onUpdateSubCatProducts);

  }


  void _onLoadSubCatProducts(
      LoadSubCatProducts event,
      Emitter<ProductSubCatState> emit,
      ) {
    _productSubCatSubscription?.cancel();
    _productSubCatSubscription = _productsubCatRepository.getAllSubCatProducts().listen(
          (products) => add(
        UpdateSubCatProducts(products),
      ),
    );
  }



  void _onUpdateSubCatProducts(
      UpdateSubCatProducts event,
      Emitter<ProductSubCatState> emit,
      ) {
    emit(ProductSubCatLoaded(products: event.products));
  }
}