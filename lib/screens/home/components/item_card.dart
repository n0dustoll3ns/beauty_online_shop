import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:beauty_online_shop/models/perfumery.dart';

class ProductCard extends StatefulWidget {
  final Perfumery product;
  final Function press;
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.press();
      },
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                  color: widget.product.color,
                  borderRadius: BorderRadius.circular(16)),
              child: Hero(
                tag: "${widget.product.properties[widget.product.properties.keys.toList().first]!.id}",
                child: Image.asset(widget.product.properties[widget.product.properties.keys.toList().first]!.image),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              widget.product.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Text('₽ ' + widget.product.properties[widget.product.properties.keys.toList().first]!.price.toString())
        ],
      ),
    );
  }
}
