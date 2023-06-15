import 'package:flutter/material.dart';
import 'package:furniture2_ui/components/sub_title_text.dart';
import 'package:furniture2_ui/components/title_text.dart';
import 'package:furniture2_ui/models/Product.dart';
import 'package:furniture2_ui/screens/detail/detail_screen.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required Product product,
  })  : product = product,
        super(key: key);

  final Product product;
  double _defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailScreen(product: product)),
      ),
      child: Container(
        width: _defaultSize * 17,
        padding: EdgeInsets.all(_defaultSize),
        decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(30)),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/icons/loading_2.gif",
                    placeholderScale: _defaultSize * 0.05,
                    image: product.image,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: _defaultSize),
                  child: TitleText(title: product.title)),
              SizedBox(height: _defaultSize),
              SubTitleText(
                  title: "${NumberFormat("#,###").format(product.price)}\$"),
            ],
          ),
        ),
      ),
    );
  }
}
