

import 'package:flutter/material.dart';

class BottomDetailPageBar extends StatelessWidget {
  const BottomDetailPageBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
