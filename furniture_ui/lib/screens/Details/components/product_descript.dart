import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';

class ProductDescript extends StatelessWidget {
  final String title;
  final int price;
  final String descript;
  const ProductDescript({
    Key? key,
    required this.title,
    required this.price,
    required this.descript,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            "\$$price",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(height: 10),
          Text(
            "\t\t" + descript,
            style: TextStyle(color: kTextLightColor),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
