import 'package:flutter/material.dart';
import 'package:furniture2_ui/components/title_text.dart';
import 'package:furniture2_ui/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final Product product;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    double _defualtSize = SizeConfig.defaultSize;
    return Container(
      constraints: BoxConstraints(minHeight: _defualtSize * 42),
      padding: EdgeInsets.only(
        top: _defualtSize * 7,
        left: _defualtSize * 2,
        right: _defualtSize * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(_defualtSize * 1.2),
          bottomRight: Radius.circular(_defualtSize * 1.2),
        ),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(title: product.subTitle),
            SizedBox(height: _defualtSize * 3),
            Text(
              product.description,
              style: TextStyle(
                color: kTextLightColor,
                height: 1.5,
              ),
            ),
            SizedBox(
              height: _defualtSize *
                  (SizeConfig.orientation == Orientation.landscape ? 1 : 14),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _defualtSize * 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(_defualtSize * 1.3),
                  onSurface: Colors.black,
                ),
                onPressed: onPress(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
