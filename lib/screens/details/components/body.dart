import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/perfumery.dart';
import 'cart_counter_w_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Perfumery product;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _selectedProperty = 0;

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
                      buildSelectableProperties(context),
                      CartCounter_w_FavBtn(),
                      Description(product: widget.product),
                    ],
                  ),
                ),
                ProductTitleWithImage(
                    title: widget.product.title,
                    properties: widget.product.properties.values.toList()[_selectedProperty]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildSelectableProperties(BuildContext context) {
    return Row(
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
                  itemCount: widget.product.properties.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedProperty = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: kDefaultPaddin / 4,
                          right: kDefaultPaddin / 2,
                        ),
                        padding: const EdgeInsets.all(2.5),
                        child: Text(widget.product.properties.values.toList()[index].volume,
                          textScaleFactor: 0.8,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _selectedProperty == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        width: 32,
                        decoration: BoxDecoration(
                          color: _selectedProperty == index
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5.6),
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
                  text: '${widget.product.brand.name}',
                  style: Theme.of(context).textTheme.headline6!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
