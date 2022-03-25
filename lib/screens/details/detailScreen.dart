import 'package:beauty_online_shop/screens/details/components/body.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/perfumery.dart';

import '../home/components/cart_icon.dart';
import 'components/bottom_detail_page_bar.dart';

class DetailPage extends StatefulWidget {
  final Perfumery product;
  DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _selectedProperty = 0;

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
            children: [
              IconButton(
                onPressed: () {},
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
      body: Body(product: widget.product),
      bottomNavigationBar: BottomDetailPageBar(
          product: widget.product, selectedVolume: _selectedProperty),
    );
  }
}
