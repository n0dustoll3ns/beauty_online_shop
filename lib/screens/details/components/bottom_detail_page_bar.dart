import 'package:flutter/material.dart';
import '../../../products/perfumery.dart';

class BottomDetailPageBar extends StatelessWidget {
  final Perfumery product;
  const BottomDetailPageBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              border: Border.all(color: product.color),
            ),
            child: IconButton(
              onPressed: null,
              icon: Icon(Icons.add_shopping_cart_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
