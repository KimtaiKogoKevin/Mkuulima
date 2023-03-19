import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/CartDeprecated.dart';
import 'DBHelper.dart';

class CartProvider with ChangeNotifier {
  DBHelper dbHelper = DBHelper();
  int _counter = 0;
  int _quantity = 1;
  int get counter => _counter;
  int get quantity => _quantity;

  double subTotal = 0.0;
  double get totalPrice => subTotal;

  List<CartDeprecated> cart = [];
   late CartDeprecated cartItems;

  Future<List<CartDeprecated>> getData() async {
    cart = await dbHelper.getCartList();
    notifyListeners();
    return cart;
  }

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);

    return unit8List;
  }

  void _setPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_items', _counter);
    prefs.setInt('item_quantity', _quantity);
    prefs.setDouble('total_price', subTotal);
    notifyListeners();
  }

  void _getPrefsItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_items') ?? 0;
    _quantity = prefs.getInt('item_quantity') ?? 1;
    subTotal = prefs.getDouble('total_price') ?? 0;
  }

  void addCounter() {
    _counter++;
    _setPrefsItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefsItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefsItems();
    return _counter;
  }

  void addQuantity(String id) {
    final index = cart.indexWhere((element) => element.id == id);
    cart[index].quantity!.value = cart[index].quantity!.value + 1;
    _setPrefsItems();
    notifyListeners();
  }

  void deleteQuantity(String id) {
    final index = cart.indexWhere((element) => element.id == id);
    final currentQuantity = cart[index].quantity!.value;
    if (currentQuantity <= 1) {
      currentQuantity == 1;
    } else {
      cart[index].quantity!.value = currentQuantity - 1;
    }
    _setPrefsItems();
    notifyListeners();
  }

  void removeItem(String id) {
    final index = cart.indexWhere((element) => element.id == id);
    cart.removeAt(index);
    _setPrefsItems();
    notifyListeners();
  }

  int getQuantity(int quantity) {
    _getPrefsItems();
    return _quantity;
  }

  void addSubTotalPrice(double productPrice) {
    subTotal = subTotal + productPrice;
    _setPrefsItems();
    notifyListeners();
  }

  void removeSubTotalPrice(double productPrice) {
    subTotal = subTotal - productPrice;
    _setPrefsItems();
    notifyListeners();
  }


  double deliveryFee(subtotal) {
    if (subtotal >= 1.00 && subtotal <= 5000) {
      return 150.0;
    } else {
      return 0.0;
    }
  }
  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);

  double total(subtotal , deliveryFee){
    return subtotal + deliveryFee(subtotal);
  }
  double getSubTotalPrice() {
    _getPrefsItems();
    return subTotal;
  }
}