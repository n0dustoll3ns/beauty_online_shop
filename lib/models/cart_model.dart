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
    var _itemStringIDs_in_cart = storage.getStringList('cart');
    _itemStringIDs_in_cart!.forEach((element) {
      _itemIDs_in_cart.add(int.parse(element));
    });
    notifyListeners();
  }

  Map<Map<Perfumery, int>, int> getUnmodifiable_cart_list() {
    Map<int, int> itemIDcounter = {};
    _itemIDs_in_cart.forEach((id) {
      if (!itemIDcounter.containsKey(id)) {
        itemIDcounter[id] = 1;
      } else {
        itemIDcounter.update(id, (value) => value + 1);
      }
    });
    Map<Map<Perfumery, int>, int> unmodifiable_cart_list = {};

    itemIDcounter.keys.forEach((id) {
      unmodifiable_cart_list.addAll({
        {searchByID(id)!: id}: itemIDcounter[id]!
      });
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

  void removeAllItemsWithOneID(int id) async {
    _itemIDs_in_cart.removeWhere((value) => value == id);
    saveState(_itemIDs_in_cart);
    notifyListeners();
  }

  void saveState(List<int> _itemIDs_in_cart) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList('cart', []);
    List<String> itemsStringList = [];
    _itemIDs_in_cart.forEach((value) {
      itemsStringList.add(value.toString());
    });
    storage.setStringList('cart', itemsStringList);
  }
}
