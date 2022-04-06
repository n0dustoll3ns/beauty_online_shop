import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/perfumery.dart';
import '../cart/cart_screen.dart';
import '../home/components/cart_icon.dart';
import 'components/bottom_detail_page_bar.dart';
import 'components/body.dart';

class DetailPage extends StatefulWidget {
  final Perfumery product;
  DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedVolume = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: AppBar(
        backgroundColor: widget.product.color,
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_bag_outlined),
              ),
              EmptynessIndicatorOfCart(),
            ],
          ),
          SizedBox(
            width: kDefaultPaddin / 2,
          ),
        ],
      ),
      body: Body(
        product: widget.product,
        selectedProperty: selectedVolume,
        onPropertyChange: (int value) {
          setState(
            () => selectedVolume = value,
          );
        },
      ),
      bottomNavigationBar: BottomDetailPageBar(
          product: widget.product,
          selectedVolume:
              widget.product.properties.values.toList()[selectedVolume].id),
    );
  }
}
