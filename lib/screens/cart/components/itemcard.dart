
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/perfumery.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.itemInCart,
    required this.count,
  }) : super(key: key);

  final Map<Perfumery, int> itemInCart;
  final int count;

  @override
  Widget build(BuildContext context) {
    var product = itemInCart.keys.toList().first;
    var selectedVolume = itemInCart.values.toList().first;
    return Dismissible(
      key: Key(product.properties[selectedVolume]!.id.toString()),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(6),
            width: 102,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(kDefaultPaddin / 2),
                decoration: BoxDecoration(
                    color: product.color,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(product.properties[selectedVolume]!.image),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title +
                      ' ' +
                      product.properties[selectedVolume]!.volume +
                      ' ml',
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text.rich(
                  TextSpan(
                    text: '\₽ ${product.properties[selectedVolume]!.price} ',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '× $count ',
                        children: [],
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
