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
  final ProductSubCatRepository _productSubCatRepository;

  StreamSubscription? _productSubCatSubscription;

  ProductSubCatBloc({required ProductSubCatRepository productSubCatRepository})
      : _productSubCatRepository = productSubCatRepository,
        super(ProductSubCatLoading()) {
    on<LoadSubCatProducts>(_onLoadSubCatProducts);
    on<SubCatSelected>(_onSubCatSelectedProducts);
    on<UpdateSubCatProducts>(_onUpdateSubCatProducts);
  }

  void _onLoadSubCatProducts(LoadSubCatProducts event,
      Emitter<ProductSubCatState> emit,) {
    try {

      _productSubCatSubscription?.cancel();
      _productSubCatSubscription =
          _productSubCatRepository.getAllSubCatProducts('Nike Jordans')
              .listen(
                (products,) =>
                add(
                  UpdateSubCatProducts(
                    products,
                  ),
                ),
          );
    }
    on Exception {
      emit((const ProductError(error: "Error")));
    }
  }
  void _onSubCatSelectedProducts(SubCatSelected event,
      Emitter<ProductSubCatState> emit,) {
    try {

      _productSubCatSubscription?.cancel();
      _productSubCatSubscription =
          _productSubCatRepository.getAllSubCatProducts(event.subCatSelected)
              .listen(
                (products,) =>
                add(
                  UpdateSubCatProducts(
                    products,
                  ),
                ),
          );
    }
    on Exception {
      emit((const ProductError(error: "Error")));
    }
  }

  void _onUpdateSubCatProducts(UpdateSubCatProducts event,
      Emitter<ProductSubCatState> emit,) {
    emit(ProductSubCatLoaded(products: event.products));
  }
}
