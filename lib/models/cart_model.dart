import 'package:beauty_online_shop/models/perfumery.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

List<Perfumery> _items_in_cart = [];

class CartModel extends ChangeNotifier {
  final Map<ProductInCart, int> _items_in_cart_counter = {};

  Future<Map<ProductInCart, int>> get unmodifiable_cart_list async {
    var storage = await SharedPreferences.getInstance();
    return _items_in_cart_counter;
  }

  int get totalPrice => _items_in_cart.length * 42;

  void add(Perfumery item, int index) async {
    var storage = await SharedPreferences.getInstance();
    ProductInCart productInCart = ProductInCart(item, index);
    String productInCartInString = jsonEncode(productInCart.toJson());
    if (storage.containsKey(productInCartInString)) {
      storage.setInt(
          productInCartInString, storage.getInt(productInCartInString)! + 1);
    } else {
      storage.setInt(productInCartInString, 1);
    }
    ;
    notifyListeners();
  }

  void removeAll() {
    _items_in_cart_counter.clear();
    notifyListeners();
  }

  void loadState() async {
    var storage = await SharedPreferences.getInstance();
    for (String key in storage.getKeys()) {
      _items_in_cart_counter.addAll(
          {ProductInCart.fromJson(jsonDecode(key)): storage.getInt(key)!});
    }
  }

  void saveState() async {
    var storage = await SharedPreferences.getInstance();

    _items_in_cart_counter.forEach((productInCart, count) {
      storage.setInt(jsonEncode(productInCart.toJson()), count);
    });
  }
}
