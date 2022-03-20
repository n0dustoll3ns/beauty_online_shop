import 'package:flutter/material.dart';
import '../../../models/perfumery.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Fragrance product;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${product.description}',
    );
  }
}
