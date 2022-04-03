import 'package:beauty_online_shop/constants.dart';
import 'package:beauty_online_shop/models/perfumery.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:beauty_online_shop/models/cart_model.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        var cartlist = cart.unmodifiable_cart_list;
        return ListView.builder(
          itemCount: cartlist.length,
          itemBuilder: (context, index) {
            var productInCart = cartlist.keys.elementAt(index);
            return CartItemCard(
                productInCart: productInCart, cartlist: cartlist);
          },
        );
      },
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.productInCart,
    required this.cartlist,
  }) : super(key: key);

  final ProductInCart productInCart;
  final Map<ProductInCart, int> cartlist;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(12)),
              child: Image.asset(productInCart
                  .product.properties[productInCart.selectedProperty].image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          children: [
            Text(productInCart.product.title +
                ' ' +
                '${productInCart.product.properties[productInCart.selectedProperty].volume}'),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  color: Colors.orangeAccent,
                ),
                text:
                    '\₽ ${productInCart.product.properties[productInCart.selectedProperty].price} ',
                children: [
                  TextSpan(
                    text: 'ˣ${cartlist[productInCart]} ',
                    children: [],
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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