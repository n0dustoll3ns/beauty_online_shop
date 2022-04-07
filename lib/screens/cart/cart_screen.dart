import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_model.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: Container(
        height: 174,
        decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
              )
            ]),
      ),
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
                return Text('${cart.getUnmodifiable_cart_list().length} items',
                    style: Theme.of(context).textTheme.caption);
              },
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Provider.of<CartModel>(context, listen: false).removeAll();
          },
          icon: const Icon(Icons.restore_from_trash_sharp),
        )
      ],
    );
  }
}
