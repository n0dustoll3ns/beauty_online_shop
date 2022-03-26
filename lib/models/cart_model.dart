import 'package:beauty_online_shop/models/perfumery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Perfumery> _items_in_cart = [];

class CartModel extends ChangeNotifier {
  final List<Perfumery> _items_in_cart = [];

  List<Perfumery> get items_in_cart => _items_in_cart;
  int get totalPrice => _items_in_cart.length * 42;

  void add(Perfumery item, int index) {
    item.properties = item.properties.sublist(index, index + 1);
    _items_in_cart.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items_in_cart.clear();
    notifyListeners();
  }
}
