import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:beauty_online_shop/products/perfumery.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Perfumery product;

  const Body({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text('Value'),
                              ValueDot(product: product, isSelected: false, value: 100,),
                              ValueDot(product: product, isSelected: true, value: 50,),
                              ValueDot(product: product, isSelected: false, value: 75,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ValueDot extends StatelessWidget {
  final int value;
  final bool isSelected;
  const ValueDot({
    Key? key,
    required this.product, required this.value, required this.isSelected,
  }) : super(key: key);

  final Perfumery product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      child: Text(
        product.volume.toString(),
        textScaleFactor: 0.8,
        textAlign: TextAlign.center,
      ),
      width: 28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0XFF000000),
        ),
      ),
    );
  }
}
