import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Product.dart';
import '../../models/Wishlist.dart';


part 'wishlist_event.dart';

part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading()) {
    on<StartWishlist>(_onLoadWishlist);
    on<AddWishlistProduct>(_onAddWishlist);
    on<RemoveWishlistProduct>(_onRemoveWishlist);
  }

  void _onLoadWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());

    try {
      await Future<void>.delayed(const Duration (seconds: 1));
      emit(const WishlistLoaded());
    }
    catch (_) {
      emit(WishlistError());
    }
  }

  void _onAddWishlist(event, Emitter<WishlistState> emit) async {
    final state = this.state;

    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishlist: WishList(
            products: List.from(state.wishlist.products)
              ..add(event.product),
          ),
        )
        );
      }
      on Exception {
        emit(WishlistError());
      }
    }
  }

  void _onRemoveWishlist(event, Emitter<WishlistState> emit) async {
    final state = this.state;

    if (state is WishlistLoaded) {
      try {
        emit(WishlistLoaded(
          wishlist: WishList(
            products: List.from(state.wishlist.products)
              ..remove(event.product),
          ),
        )
        );
      }
      on Exception {
        emit(WishlistError());
      }
    }
  }


}





