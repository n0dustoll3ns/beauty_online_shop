import 'package:beauty_online_shop/models/perfumery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Perfumery> items_in_cart = [];

class CartModel extends ChangeNotifier {
  final List<Perfumery> _items_in_cart = [];

  int get totalPrice => _items_in_cart.length * 42;

  void add(Perfumery product) {
    _items_in_cart.add(product);
    notifyListeners();
  }

    void removeAll() {
    _items_in_cart.clear();
    notifyListeners();
  }


}