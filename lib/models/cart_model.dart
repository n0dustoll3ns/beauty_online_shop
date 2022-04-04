import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/perfumery.dart';

class CartModel extends ChangeNotifier {
  Set<int> _itemIDs_in_cart = {};
  CartModel.fromStorage() {
    loadState();
  }

  void loadState() async {
    var storage = await SharedPreferences.getInstance();
    if (storage.getStringList('cart') == null) {
      storage.setStringList('cart', []);
    }
    for (String stringID in storage.getStringList('cart')!) {
      int intID = int.parse(stringID);
      _itemIDs_in_cart.add(intID);
    }
    notifyListeners();
  }

  Map<Map<Perfumery, int>, int> getUnmodifiable_cart_list() {
    Map<Map<Perfumery, int>, int> unmodifiable_cart_list = {};
    _itemIDs_in_cart.forEach((iD) {
      for (var item in perfumery) {
        if (item.properties.containsKey(iD)) {
          if (unmodifiable_cart_list.containsKey({item: iD})) {
            unmodifiable_cart_list.update({item: iD}, (value) => value + 1);
          } else {
            unmodifiable_cart_list.addAll({
              {item: iD}: 1
            });
          }
        }
      }
    });
    return unmodifiable_cart_list;
  }

  void add(Perfumery item, int index) {
    _itemIDs_in_cart.add(item.properties[index]!.id);
    saveState(_itemIDs_in_cart);
    notifyListeners();
  }

  void removeAll() async {
    var storage = await SharedPreferences.getInstance();
    for (var key in storage.getKeys()) {
      storage.remove(key);
    }
    _itemIDs_in_cart.clear();
    notifyListeners();
  }

  void saveState(Set<int> _items_in_cart) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList('cart', []);
    List<String> itemsStringList = [];
    _items_in_cart.forEach((value) {
      itemsStringList.add(value.toString());
    });
    storage.setStringList('cart', itemsStringList);
  }
}
