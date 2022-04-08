import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beauty_online_shop/models/cart_model.dart';

class EmptynessIndicatorOfCart extends StatelessWidget {
  const EmptynessIndicatorOfCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Positioned(
          right: 12,
          bottom: 15,
          child: Container(
            height: 9,
            width: 9,
            decoration: BoxDecoration(
              color: 
              cart.getUnmodifiableCartList().isEmpty
                  ? Colors.transparent
                  : Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
}
