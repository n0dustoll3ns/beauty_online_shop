import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/perfumery.dart';

class CartModel extends ChangeNotifier {
  List<int> _itemIDs_in_cart = [];
  CartModel.fromStorage() {
    loadState();
  }

  void loadState() async {
    var storage = await SharedPreferences.getInstance();
    var itemStringIDsInCart = storage.getStringList('cart');
    for (var element in itemStringIDsInCart!) {
      _itemIDs_in_cart.add(int.parse(element));
    }
    notifyListeners();
  }

  Map<Map<Perfumery, int>, int> getUnmodifiableCartList() {
    Map<int, int> itemIDcounter = {};
    for (var id in _itemIDs_in_cart) {
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

  int gettotalPrice() {
    int totalPrice = 0;
    for (var id in _itemIDs_in_cart) {
      var product = searchByID(id)!;
      totalPrice = totalPrice + searchByID(id)!.properties[id]!.price;
    }
    return totalPrice;
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

  void removeAllItemsWithOneID(int id) async {
    _itemIDs_in_cart.removeWhere((value) => value == id);
    saveState(_itemIDs_in_cart);
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
