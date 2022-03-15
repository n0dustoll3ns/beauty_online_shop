// ignore: file_names
import 'package:beauty_online_shop/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:beauty_online_shop/products/perfumery.dart';

class DetailPage extends StatelessWidget {
  final Perfumery product;

  const DetailPage({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
      actions: <Widget>[
      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
      SizedBox(
        width: kDefaultPaddin / 2,
      ),
    ],
      ),
      body: Body(),
    );
  }
}