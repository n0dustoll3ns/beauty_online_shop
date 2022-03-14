import 'package:flutter/material.dart';
import 'package:beauty_online_shop/constants.dart';
import 'package:beauty_online_shop/products/perfumery.dart';

class ProductCard extends StatelessWidget {
  final Perfumery product;
  final Function press;
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press(),
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                  color: product.color, borderRadius: BorderRadius.circular(16)),
              child: Image.asset(product.image),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Text('₽ ' + product.price.toString())
        ],
      ),
    );
  }
}

