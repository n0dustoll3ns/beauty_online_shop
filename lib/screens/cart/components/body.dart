import 'package:beauty_online_shop/constants.dart';
import 'package:beauty_online_shop/models/perfumery.dart';
import 'package:flutter/material.dart';
import 'package:beauty_online_shop/models/cart_model.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        var cartlist = cart.getUnmodifiable_cart_list();
        return ListView.builder(
          itemCount: cartlist.length,
          itemBuilder: (context, index) {
            var itemInCart = cartlist.keys.elementAt(index);
            return CartItemCard(
                itemInCart: itemInCart, count: cartlist[itemInCart]!,);
          },
        );
      },
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.itemInCart,
    required this.count,
  }) : super(key: key);

  final Map<Perfumery, int> itemInCart;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(6),
          width: 102,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin / 2),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(itemInCart.keys.toList()[0].properties[itemInCart.values.toList()]![0]!),
            ),
          ),
        ),
        SizedBox(width: 16),
        Padding(
          padding: const EdgeInsets.all(kDefaultPaddin / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemInCart.product.title +
                    ' ' +
                    itemInCart.product
                        .properties[itemInCart.selectedProperty].volume +
                    ' ml',
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
              Text.rich(
                TextSpan(
                  text:
                      '\₽ ${itemInCart.product.properties[itemInCart.selectedProperty].price} ',
                  style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'ˣ ${cartlist[itemInCart]} ',
                      children: [],
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
      ],
    );
  }
}


// return Consumer<CartModel>(
//       builder: (context, _items_in_cart, child) {
//         return ListView.builder(
//               itemCount: cart.unmodifiable_cart_list.length,
//               itemBuilder: (context, index) => Row(
//                 children: [],
//               ),
            
//       },
//     );