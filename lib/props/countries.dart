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
    return countries[id];
  }
}

List<Country> countries = [
  Country(id: 0, name: 'Italy'),
  Country(id: 1, name: 'France'),
  Country(id: 2, name: 'Oman'),
];
