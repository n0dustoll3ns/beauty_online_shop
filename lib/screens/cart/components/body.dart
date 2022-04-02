import 'package:beauty_online_shop/constants.dart';
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
            var key = cartlist.keys.elementAt(index);
            return Row(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      padding: EdgeInsets.all(kDefaultPaddin),
                      decoration: BoxDecoration(color: Colors.black54,borderRadius: BorderRadius.circular(12)),
                      child: Image.asset(
                          key.product.properties[key.selectedProperty].image),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(children: [
                  Text(key.product.title)
                ],)
              ],
            );
          },
        );
      },
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