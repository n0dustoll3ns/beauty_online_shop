import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beauty_online_shop/models/cart_model.dart';


class CartIcon extends StatelessWidget {
  const CartIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, _items_in_cart, child) {
        
        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_outlined),
            ),
            Positioned(
              right: 12,
              bottom: 15,
              child: Container(
                height: 9,
                width: 9,
                decoration: BoxDecoration(
                  color: _items_in_cart.items_in_cart.isEmpty ? Colors.transparent: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
