import 'package:flutter/material.dart';
import '../../../products/perfumery.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Perfumery product;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${product.description}',
    );
  }
}
