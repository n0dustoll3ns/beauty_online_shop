import 'package:beauty_online_shop/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:beauty_online_shop/constants.dart';
import 'components/body.dart';
import 'components/cart_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {},
      color: kTextColor,
    ),
    actionsIconTheme: const IconThemeData(
      color: kTextColor,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
          const EmptynessIndicatorOfCart(),
        ],
      ),
      const SizedBox(
        width: kDefaultPaddin / 2,
      ),
    ],
  );
}
