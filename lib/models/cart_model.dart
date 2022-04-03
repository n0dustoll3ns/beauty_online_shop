import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/perfumery.dart';

class CartModel extends ChangeNotifier {
  Map<ProductInCart, int> _items_in_cart = {};
  CartModel.fromStorage() {
    loadState();
  }

  void loadState() async {
    var storage = await SharedPreferences.getInstance();

    for (String key in storage.getKeys()) {
      _items_in_cart[ProductInCart.fromJson(jsonDecode(key))] =
          storage.getInt(key)!;
    }
    notifyListeners();
  }

  Map<ProductInCart, int> get unmodifiable_cart_list => _items_in_cart;

  void add(Perfumery item, int index) {
    ProductInCart productInCart = ProductInCart(item, index);
    if (_items_in_cart.containsKey(productInCart)) {
      _items_in_cart.update(productInCart, (value) => value + 1);
    } else {
      _items_in_cart[productInCart] = 1;
    }
    saveState(productInCart);
    notifyListeners();
  }

  void removeAll() async {
    var storage = await SharedPreferences.getInstance();
    for (var key in storage.getKeys()) {
      storage.remove(key);
    }
    _items_in_cart.clear();
    notifyListeners();
  }

  void saveState(productInCart) async {
    var storage = await SharedPreferences.getInstance();
    storage.clear();
    _items_in_cart.forEach((productInCart, count) {
      storage.setInt(jsonEncode(productInCart.toJson()), count);
    });
  }
}
