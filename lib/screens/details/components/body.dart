import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/perfumery.dart';
import 'cart_counter_w_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Perfumery product;
  final int selectedProperty;
  final Function(int) onPropertyChange;
  const Body({
    Key? key,
    required this.product,
    required this.selectedProperty,
    required this.onPropertyChange,
  }) : super(key: key);

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
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Volume'),
                                Container(
                                  height: 25,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: product.properties.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          onPropertyChange(index);
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                            top: kDefaultPaddin / 4,
                                            right: kDefaultPaddin / 2,
                                          ),
                                          padding: const EdgeInsets.all(2.5),
                                          child: Text(
                                            product.properties.values
                                                .toList()[index]
                                                .volume,
                                            textScaleFactor: 0.8,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: selectedProperty == index
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          width: 32,
                                          decoration: BoxDecoration(
                                            color: selectedProperty == index
                                                ? Colors.black
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5.6),
                                            border: Border.all(
                                              color: Color(0XFF000000),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
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
                      ),
                      CartCounter_w_FavBtn(),
                      Container(
                          constraints:
                              BoxConstraints(minHeight: size.height / 3.7),
                          child: Description(product: product)),
                    ],
                  ),
                ),
                ProductTitleWithImage(
                    title: product.title,
                    properties:
                        product.properties.values.toList()[selectedProperty]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
