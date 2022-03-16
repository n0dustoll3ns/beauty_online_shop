import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import 'package:beauty_online_shop/products/perfumery.dart';
import 'cart_counter.dart';
import 'description.dart';
import 'product_title_with_image.dart';
import 'props_layout.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Perfumery product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      PropsLayout(product: product),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartCounter(),
                          Container(
                            
                            padding: EdgeInsets.all(8),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle
                            ),
                            child: SvgPicture.asset("assets/icons/heart.svg"),
                          )
                        ],
                      ),
                      Description(product: product),
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
