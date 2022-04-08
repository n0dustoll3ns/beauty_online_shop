import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../models/cart_model.dart';
import 'components/body.dart';
import 'components/bottom_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CheckOutBottomBar(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.grey,
      title: Center(
        child: Column(
          children: [
            const Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Consumer<CartModel>(
              builder: (context, cart, child) {
                return Text('${cart.getUnmodifiableCartList().length} items',
                    style: Theme.of(context).textTheme.caption);
              },
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: IconButton(
            onPressed: () {
              Provider.of<CartModel>(context, listen: false).removeAll();
            },
            icon: SvgPicture.asset(
              "assets/icons/cart_clear.svg",
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
