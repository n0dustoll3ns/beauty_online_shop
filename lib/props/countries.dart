import 'package:flutter/material.dart';

class Country {
  int id;
  final String name;
  Country({
    required this.id,
    required this.name,
  });
  static fromID(
    int id
  ) {
    return Countries[id];
  }
}

List<Country> Countries = [
  Country(id: 0, name: 'Italy'),
  Country(id: 1, name: 'France'),
  Country(id: 2, name: 'UAE'),
];
