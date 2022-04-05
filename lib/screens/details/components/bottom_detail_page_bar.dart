import 'package:beauty_online_shop/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../models/cart_model.dart';
import '../../../models/perfumery.dart';

class BottomDetailPageBar extends StatelessWidget {
  final Perfumery product;
  final int selectedVolume;
  BottomDetailPageBar({
    Key? key,
    required this.product,
    required this.selectedVolume,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.all(kDefaultPaddin / 2),
            height: 40,
            width: 78,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: product.color),
            ),
            child: IconButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(product,
                    product.properties[selectedVolume]!.id);
              },
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                color: product.color,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(kDefaultPaddin / 2),
              height: 40,
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: product.color),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Text(
                  'BUY NOW',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
