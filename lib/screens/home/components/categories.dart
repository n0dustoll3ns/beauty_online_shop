import 'package:flutter/material.dart';
import 'package:beauty_online_shop/constants.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ['Perfume', 'Cosmetics', 'MakeUp', 'Bijoux', '121'];
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _selectedCategory == index
                            ? kTextColor
                            : kTextLightColor),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: kDefaultPaddin / 4), //top padding
                    height: 2,
                    width: 30,
                    color: _selectedCategory == index
                        ? Colors.black
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
