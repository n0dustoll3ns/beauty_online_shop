import 'package:flutter/material.dart';
import 'package:beauty_online_shop/models/cart_model.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, _items_in_cart, child) {
        return Column(
          children: [
            // ListView.builder(
            //   // itemCount: _items_in_cart.unmodifiable_cart_list.length,
            //   itemBuilder: (context, index) => Row(
            //     children: [],
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
