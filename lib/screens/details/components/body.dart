import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:beauty_online_shop/products/perfumery.dart';
import 'description.dart';
import 'product_title_with_image.dart';
import 'props_layout.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Perfumery product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      PropsLayout(product: product),
                      CartCounter(),
                      Description(product: product),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlinedButton(
          icon: Icons.remove,
          press: () {},
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            '01',
            style: Theme.of(context).textTheme.headline6!,
          ),
        ),
        buildOutlinedButton(
          icon: Icons.add,
          press: () {},
        ),
      ],
    );
  }

  Container buildOutlinedButton(
      {required IconData icon, required Function() press}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
      width: 52,
      child: OutlinedButton(
        onPressed: press,
        child: Icon(
          icon == Icons.remove ? Icons.remove : Icons.add,
          color: Colors.black54,
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(color: Colors.black54)))),
      ),
    );
  }
}
