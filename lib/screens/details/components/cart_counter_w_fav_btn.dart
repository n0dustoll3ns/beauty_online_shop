import 'package:flutter_svg/flutter_svg.dart';
import 'package:beauty_online_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            if (numOfItems > 1)
              setState(
                () {
                  numOfItems--;
                },
              );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
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
      padding: EdgeInsets.symmetric(vertical: kDefaultPaddin / 2),
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

class CartCounter_w_FavBtn extends StatelessWidget {
  const CartCounter_w_FavBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(),
        Container(
          padding: EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }
}
