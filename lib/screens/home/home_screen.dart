import 'package:flutter/material.dart';
import 'package:beauty_online_shop/constants.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {},
      color: kTextColor,
    ),
    actionsIconTheme: IconThemeData(
      color: kTextColor,
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search),
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          Positioned(
            right: 12,
            bottom: 15,
            child: Container(
              height: 9,
              width: 9,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        width: kDefaultPaddin / 2,
      ),
    ],
  );
}
