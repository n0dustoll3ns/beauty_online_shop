import 'package:beauty_online_shop/constants.dart';
import 'package:beauty_online_shop/products/perfumery.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Beauty",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: GridView.builder(
          itemCount: perfumery_products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: kDefaultPaddin,
              mainAxisSpacing: kDefaultPaddin,
          ),
          itemBuilder: (context, index) => ProductCard(
              press: null,
              product: perfumery_products[index],
          ),
        ),
            ))
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Perfumery product;
  final Function? press;
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(kDefaultPaddin),
          // height: 180,
          // width: 160,
          decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16)),
          child: Image.asset(perfumery_products[0].image),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
          child: Text(
            perfumery_products[0].title,
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        Text('₽ ' + perfumery_products[0].price.toString())
      ],
    );
  }
}

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
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
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
              margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding
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
  }
}
