import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';
import 'package:furniture_ui/models/product.dart';
import 'package:furniture_ui/screens/Details/components/chat_addTo_cart.dart';
import 'package:furniture_ui/screens/Details/components/color_secect_dot.dart';
import 'package:furniture_ui/screens/Details/components/product_descript.dart';
import 'package:furniture_ui/screens/Details/components/product_image.dart';

class Body extends StatelessWidget {
  final Product _product;
  const Body({Key? key, required Product product})
      : _product = product,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            bottom: kDefaultPadding,
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImage(imageSrc: _product.image, id: _product.id),
              Center(child: ColorSelectDot()),
              ProductDescript(
                title: _product.title,
                price: _product.price,
                descript: _product.description,
              ),
            ],
          ),
        ),
        ChatAndAddToCart(),
      ],
    );
  }
}
