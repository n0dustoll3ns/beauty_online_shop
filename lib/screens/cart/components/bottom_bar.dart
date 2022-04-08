import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/cart_model.dart';

class CheckOutBottomBar extends StatelessWidget {
  const CheckOutBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPaddin,
        horizontal: kDefaultPaddin,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFaaaaaa).withOpacity(0.45),
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
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFe5e6e9),
                ),
                child: SvgPicture.asset(
                  "assets/icons/receipt.svg",
                  color: Colors.orange,
                ),
              ),
              const Spacer(),
              const Text("Add voucher code"),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 14,
              )
            ],
          ),
          const SizedBox(
            height: kDefaultPaddin / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Total:\n",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer<CartModel>(
                    builder: (context, cart, child) {
                      return Text(
                        "₽ ${cart.gettotalPrice()}",
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFe5e6e9),
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  padding: const EdgeInsets.all(2.0),
                  icon: const Text(
                    "Check Out",
                    style: TextStyle(
                      color: Color(0xFFe5e6e9),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
