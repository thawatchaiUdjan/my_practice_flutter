import 'package:flutter/material.dart';
import 'package:furniture2_ui/models/Product.dart';
import 'package:furniture2_ui/screens/detail/detail_screen.dart';
import 'package:furniture2_ui/screens/home/components/product_card.dart';

import '../../../size_config.dart';

class RecommentList extends StatelessWidget {
  const RecommentList({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double _defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(_defaultSize * 2),
      child: GridView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: .76,
        ),
        itemBuilder: (context, index) => ProductCard(product: products[index]),
      ),
    );
  }
}
