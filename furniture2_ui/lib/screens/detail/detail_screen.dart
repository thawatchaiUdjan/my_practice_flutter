import 'package:flutter/material.dart';
import 'package:furniture2_ui/constants.dart';
import 'package:furniture2_ui/models/Product.dart';
import 'package:furniture2_ui/screens/detail/components/body.dart';
import 'package:furniture2_ui/size_config.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black87,
            size: 30,
          ),
          onPressed: () {},
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
