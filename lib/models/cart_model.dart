import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/perfumery.dart';

class CartModel extends ChangeNotifier {
  final List<int> itemIDsInCart = [];
  CartModel.fromStorage() {
    loadState();
  }

  void loadState() async {
    var storage = await SharedPreferences.getInstance();
    var itemStringIDsInCart = storage.getStringList('cart');
    for (var element in itemStringIDsInCart!) {
      itemIDsInCart.add(int.parse(element));
    }
    notifyListeners();
  }

  Map<Map<Perfumery, int>, int> getUnmodifiableCartList() {
    Map<int, int> itemIDcounter = {};
    for (var id in itemIDsInCart) {
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
    for (var id in itemIDsInCart) {
      totalPrice = totalPrice + searchByID(id)!.properties[id]!.price;
    }
    return totalPrice;
  }

  void add(Perfumery item, int index) {
    itemIDsInCart.add(item.properties[index]!.id);
    saveState(itemIDsInCart);
    notifyListeners();
  }

  void removeAll() async {
    var storage = await SharedPreferences.getInstance();
    for (var key in storage.getKeys()) {
      storage.remove(key);
    }
    itemIDsInCart.clear();
    notifyListeners();
  }

  void removeAllItemsWithOneID(int id) async {
    itemIDsInCart.removeWhere((value) => value == id);
    saveState(itemIDsInCart);
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
