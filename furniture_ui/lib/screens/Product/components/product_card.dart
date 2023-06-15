import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';
import 'package:furniture_ui/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product _product;
  final int indexOfView;
  final Function onPress;
  const ProductCard({
    Key? key,
    required Product product,
    required this.indexOfView,
    required this.onPress,
  })  : _product = product,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        bottom: kDefaultPadding / 2,
      ),
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: () => onPress(),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(right: 7),
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: indexOfView.isEven ? kBlueColor : kSecondaryColor,
                      offset: Offset(7, -3),
                    ),
                    kDefaultShadow,
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 170,
                width: 180,
                child: Hero(
                  tag: "${_product.id}",
                  child: Image.asset(
                    _product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(
                height: 136,
                width: size.width * .5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Text(
                        _product.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 18),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 3,
                        horizontal: kDefaultPadding * 2,
                      ),
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(.6),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Text(
                        "\$${_product.price}",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
