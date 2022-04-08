import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:number_slide_animation/number_slide_animation.dart';

import '../../constants.dart';
import '../../models/cart_model.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckOutBottomBar(),
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

class CheckOutBottomBar extends StatelessWidget {
  const CheckOutBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPaddin,
        horizontal: kDefaultPaddin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFaaaaaa).withOpacity(0.45),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFFe5e6e9),
                ),
                child: SvgPicture.asset(
                  "assets/icons/receipt.svg",
                  color: Colors.orange,
                ),
              ),
              Spacer(),
              Text("Add voucher code"),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 14,
              )
            ],
          ),
          SizedBox(
            height: kDefaultPaddin / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<CartModel>(
                builder: (context, cart, child) {
                  var cartlist = cart.getUnmodifiable_cart_list();
                  return Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      children: [
                        TextSpan(
                          text: "₽ ${cart.gettotalPrice()}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Spacer(),
              Container(
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Color(0xFFe5e6e9),
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: IconButton(
                  padding: const EdgeInsets.all(2.0),
                  icon: Text(
                    "Check Out",
                    style: TextStyle(
                      color: Color(0xFFe5e6e9),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}


