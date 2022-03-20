import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:beauty_online_shop/models/perfumery.dart';

class ProductCard extends StatelessWidget {
  final Fragrance product;
  final Function press;
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16)),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
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
