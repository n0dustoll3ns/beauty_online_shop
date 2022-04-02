import 'package:beauty_online_shop/models/perfumery.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartModel extends ChangeNotifier {
  late Map<ProductInCart, int> _items_in_cart;
  CartModel.fromState() {
    loadState();
  }

  void loadState() async {
    var storage = await SharedPreferences.getInstance();
    for (String key in storage.getKeys()) {
      _items_in_cart.addAll(
          {ProductInCart.fromJson(jsonDecode(key)): storage.getInt(key)!});
    }
  }

  Map<ProductInCart, int> value() {
    return _items_in_cart;
  }

  Map<ProductInCart, int> get unmodifiable_cart_list => _items_in_cart;

  // void add(Perfumery item, int index) async {
  //   var storage = await SharedPreferences.getInstance();
  //   ProductInCart productInCart = ProductInCart(item, index);
  //   String productInCartInString = jsonEncode(productInCart.toJson());
  //   if (storage.containsKey(productInCartInString)) {
  //     storage.setInt(
  //         productInCartInString, storage.getInt(productInCartInString)! + 1);
  //   } else {
  //     storage.setInt(productInCartInString, 1);
  //   }
  //   ;
  //   notifyListeners();
  // }

  // void removeAll() {
  //   _items_in_cart_counter.clear();
  //   notifyListeners();
  // }

  void saveState() async {
    var storage = await SharedPreferences.getInstance();
    storage.clear();
    _items_in_cart.forEach((productInCart, count) {
      storage.setInt(jsonEncode(productInCart.toJson()), count);
    });
  }
}
