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
                          Row(
                            children: const [
                              Text('Value'),
                              ValueDot(
                                isSelected: false,
                                volume: 50,
                              ),
                              ValueDot(
                                isSelected: true,
                                volume: 75,
                              ),
                              ValueDot(
                                isSelected: false,
                                volume: 75,
                              ),
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
  final int volume;
  final bool isSelected;
  const ValueDot({
    Key? key,
    required this.volume,
    required this.isSelected,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      child: Text(
        volume.toString(),
        textScaleFactor: 0.8,
        textAlign: TextAlign.center,
        style:
            TextStyle(color: isSelected == true ? Colors.white : Colors.black),
      ),
      width: 28,
      decoration: BoxDecoration(
        color: isSelected == true ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0XFF000000),
        ),
      ),
    );
  }
}
