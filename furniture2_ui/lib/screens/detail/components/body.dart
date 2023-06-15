import 'package:flutter/material.dart';
import 'package:furniture2_ui/components/sub_title_text.dart';
import 'package:furniture2_ui/components/title_text.dart';
import 'package:furniture2_ui/constants.dart';
import 'package:furniture2_ui/models/Product.dart';
import 'package:furniture2_ui/screens/detail/components/product_description.dart';
import 'package:furniture2_ui/screens/detail/components/product_info.dart';
import 'package:furniture2_ui/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double _defualtSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight -
            AppBar().preferredSize.height -
            _defualtSize * 3,
        child: Stack(
          children: [
            ProductInfo(product: product),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ProductDescription(product: product, onPress: () {}),
            ),
            Positioned(
              top: _defualtSize * 8,
              right: -_defualtSize * 8,
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: _defualtSize * 40,
                  width: _defualtSize * 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
