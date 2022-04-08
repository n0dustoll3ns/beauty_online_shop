import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

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
          press: () {
            if (numOfItems > 1) {
              setState(
                () {
                  numOfItems--;
                },
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            numOfItems.toString().padLeft(2, ""),
            style: Theme.of(context).textTheme.headline6!,
          ),
        ),
        buildOutlinedButton(
          icon: Icons.add,
          press: () {
            setState(
              () {
                numOfItems++;
              },
            );
          },
        ),
      ],
    );
  }

  Container buildOutlinedButton(
      {required IconData icon, required Function() press}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
      child: OutlinedButton(
        onPressed: press,
        child: Icon(
          icon == Icons.remove ? Icons.remove : Icons.add,
          color: Colors.black54,
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: const BorderSide(color: Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}

class CartCounterWithFavBtn extends StatelessWidget {
  const CartCounterWithFavBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CartCounter(),
        Container(
          padding: const EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration:
              const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }
}
