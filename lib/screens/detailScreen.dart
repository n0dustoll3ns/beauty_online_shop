import 'package:flutter/material.dart';
import 'package:beauty_online_shop/products/perfumery.dart';

class DetailPage extends StatelessWidget {
  final Perfumery product;
  const DetailPage({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
    );
  }
}
