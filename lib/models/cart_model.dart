import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/perfumery.dart';

class CartModel extends ChangeNotifier {
  final List<int> _itemIDsInCart = [];
  CartModel.fromStorage() {
    loadState();
  }

  void loadState() async {
    var storage = await SharedPreferences.getInstance();
    var itemStringIDsInCart = storage.getStringList('cart');
    for (var element in itemStringIDsInCart!) {
      _itemIDsInCart.add(int.parse(element));
    }
    notifyListeners();
  }

  Map<Map<Perfumery, int>, int> getUnmodifiableCartList() {
    Map<int, int> itemIDcounter = {};
    for (var id in _itemIDsInCart) {
      if (!itemIDcounter.containsKey(id)) {
        itemIDcounter[id] = 1;
      } else {
        itemIDcounter.update(id, (value) => value + 1);
      }
    }
    Map<Map<Perfumery, int>, int> unmodifiableCartList = {};
    for (var id in itemIDcounter.keys) {
      unmodifiableCartList.addAll(
        {
          {searchByID(id)!: id}: itemIDcounter[id]!
        },
      );
    }
    return unmodifiableCartList;
  }

  int get totalPrice {
    int totalPrice = 0;
    for (var id in _itemIDsInCart) {
      totalPrice += searchByID(id)!.properties[id]!.price;
    }
    return totalPrice;
  }

  void add(Perfumery item, int index) {
    _itemIDsInCart.add(item.properties[index]!.id);
    saveState(_itemIDsInCart);
    notifyListeners();
  }

  void removeAll() async {
    var storage = await SharedPreferences.getInstance();
    for (var key in storage.getKeys()) {
      storage.remove(key);
    }
    _itemIDsInCart.clear();
    notifyListeners();
  }

  void removeAllItemsWithOneID(int id) async {
    _itemIDsInCart.removeWhere((value) => value == id);
    saveState(_itemIDsInCart);
    notifyListeners();
  }

  void saveState(List<int> itemIDsInCart) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList('cart', []);
    List<String> itemsStringList = [];
    for (var value in itemIDsInCart) {
      itemsStringList.add(value.toString());
    }
    storage.setStringList('cart', itemsStringList);
  }
}
