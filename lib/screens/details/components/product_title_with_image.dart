import 'package:flutter/material.dart';
import '../../../models/perfumery.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Perfumery product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Парфюмированная вода',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Price\n'),
                    TextSpan(
                      text: '₽${product.properties[0].price}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.properties[0].id}",
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset(
                      product.properties[0].image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
