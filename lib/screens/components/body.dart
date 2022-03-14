import 'package:beauty_online_shop/constants.dart';
import 'package:beauty_online_shop/products/perfumery.dart';
import 'package:beauty_online_shop/screens/detailScreen.dart';
import 'package:beauty_online_shop/screens/components/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              style: TextStyle(
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



class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Beauty",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
            itemCount: perfumery_products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              crossAxisSpacing: kDefaultPaddin,
              mainAxisSpacing: kDefaultPaddin,
            ),
            itemBuilder: (context, index) => ProductCard(
                press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(product: perfumery_products[index]))),
                product: perfumery_products[index]),
          ),
        ))
      ],
    );
  }
}

