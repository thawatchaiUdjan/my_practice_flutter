import 'package:flutter/material.dart';
import 'package:furniture2_ui/components/sub_title_text.dart';
import 'package:furniture2_ui/components/title_text.dart';
import 'package:furniture2_ui/models/Product.dart';
import 'package:furniture2_ui/screens/detail/components/color_select_list.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductInfo extends StatelessWidget {
  ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  double _defualtSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _defualtSize * 30,
      width: _defualtSize *
          (SizeConfig.orientation == Orientation.landscape ? 35 : 15),
      padding: EdgeInsets.symmetric(horizontal: _defualtSize * 2),
      color: Colors.transparent,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(title: product.category.toUpperCase()),
            Text(
              product.title,
              style: kTextHeader.copyWith(
                fontSize: _defualtSize * 2.5,
                letterSpacing: -0.8,
                height: 1.4,
              ),
            ),
            SizedBox(height: _defualtSize * 2),
            SubTitleText(title: "Form"),
            TitleText(
                title: "\$${NumberFormat("#,###").format(product.price)}"),
            SizedBox(height: _defualtSize * 2),
            SubTitleText(title: "Avalible Colors"),
            ColorSelectList(),
          ],
        ),
      ),
    );
  }
}
