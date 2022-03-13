import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          color: Colors.black54,
        ),
        actionsIconTheme : IconThemeData(color: Colors.black54,
),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
          
        ],
      ),
    );
  }
}
