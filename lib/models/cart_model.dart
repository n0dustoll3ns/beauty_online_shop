import 'package:beauty_online_shop/models/perfumery.dart';
import 'package:flutter/material.dart';

List<Perfumery> _items_in_cart = [];

class CartModel extends ChangeNotifier {
  final List<ProductInCart> _items_in_cart = [];
  final Map<ProductInCart, int> _items_in_cart_counter = {};

  List<ProductInCart> get unmodifiable_cart_list => _items_in_cart;
  int get totalPrice => _items_in_cart.length * 42;

  void add(Perfumery item, int index) {
    ProductInCart productInCart = ProductInCart(item, index);
    if(_items_in_cart.contains(productInCart)){};
    _items_in_cart.add(productInCart);
    notifyListeners();
  }

  void removeAll() {
    _items_in_cart.clear();
    notifyListeners();
  }
}
