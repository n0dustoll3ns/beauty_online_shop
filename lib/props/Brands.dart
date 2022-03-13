import 'package:flutter/material.dart';

class Brand {
  final int id;
  final String name;
  static fromID(int id) {
    return Brands[id];
  }
  Brand({
    required this.id,
    required this.name,
  });
}

List<Brand> Brands = [
  Brand(id: 0,name: 'Creed'),
  Brand(id: 1,name: 'Amouage'),
  Brand(id: 2,name: 'Afnan'),
];
