import 'package:flutter/material.dart';
import '../../../models/perfumery.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key? key,
    required this.properties,
    required this.title,
  }) : super(key: key);
  final String title;
  final PerfumeryProperties properties;

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
            title,
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
                      text: '₽${properties.price}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${properties.id}",
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset(
                      properties.image,
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
