import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../products/perfumery.dart';
import 'body.dart';


class PropsLayout extends StatelessWidget {
  const PropsLayout({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Perfumery product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Volume'),
              Row(
                children: [
                  VolumeDot(
                    isSelected: false,
                    volume: 50,
                    product: product,
                  ),
                  VolumeDot(
                    isSelected: true,
                    volume: 75,
                    product: product,
                  ),
                  VolumeDot(
                    isSelected: false,
                    volume: 100,
                    product: product,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(text: "Brand\n"),
                TextSpan(
                  text: '${product.brand.name}',
                  style:
                      Theme.of(context).textTheme.headline6!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
