import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:beauty_online_shop/products/perfumery.dart';

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
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Парфюмированная вода',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
