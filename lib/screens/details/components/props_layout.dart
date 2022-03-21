import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/perfumery.dart';
import 'body.dart';

class VolumeDot extends StatelessWidget {
  final int volume;
  final bool isSelected;
  const VolumeDot({
    Key? key,
    required this.volume,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      child: Text(
        volume.toString(),
        textScaleFactor: 0.8,
        textAlign: TextAlign.center,
        style:
            TextStyle(color: isSelected == true ? Colors.white : Colors.black),
      ),
      width: 28,
      decoration: BoxDecoration(
        color: isSelected == true ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(5.6),
        border: Border.all(
          color: Color(0XFF000000),
        ),
      ),
    );
  }
}

class PropsLayout extends StatelessWidget {
  const PropsLayout({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Perfumery product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Volume'),
              Container(
                height: 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.properties.length,
                  itemBuilder: (BuildContext context, int index) {
                    return VolumeDot(
                        isSelected: false,
                        volume: product.properties[index].volume);
                  },
                  
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor),
              children: [
                TextSpan(text: "Brand\n"),
                TextSpan(
                  text: '${product.brand.name}',
                  style: Theme.of(context).textTheme.headline6!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
