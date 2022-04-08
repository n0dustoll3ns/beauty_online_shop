import 'package:flutter/material.dart';
import 'package:beauty_online_shop/models/cart_model.dart';
import 'package:provider/provider.dart';

import 'itemcard.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        var cartlist = cart.getUnmodifiableCartList();
        return ListView.builder(
          itemCount: cartlist.length,
          itemBuilder: (context, index) {
            var itemInCart = cartlist.keys.elementAt(index);
            return CartItemCard(
              itemInCart: itemInCart,
              count: cartlist[itemInCart]!,
            );
          },
        );
      },
    );
  }
}
