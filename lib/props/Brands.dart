class Brand {
  int id;
  final String name;
  Brand({
    required this.id,
    required this.name,
  });
  static fromID(int id) {
    return brands[id];
  }
}

List<Brand> brands = [
  Brand(id: 0, name: 'Creed'),
  Brand(id: 1, name: 'Amouage'),
  Brand(id: 2, name: 'Afnan'),
  Brand(id: 3, name: 'Memo'),
];
