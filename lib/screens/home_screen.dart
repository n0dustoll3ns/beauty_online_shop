import 'package:flutter/material.dart';
import 'package:beauty_online_shop/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }
}

AppBar buildAppBar(){
  return       AppBar(: AppBar(
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
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag_outlined)),
          SizedBox(
            width: kDefaultPaddin / 2,
          ),
        ],
      ),
  )
}