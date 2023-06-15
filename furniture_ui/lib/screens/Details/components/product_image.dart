import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageSrc;
  final int id;

  const ProductImage({
    Key? key,
    required this.imageSrc,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: size.width * .8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: size.width * .65,
            height: size.width * .65,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Hero(
            tag: "$id",
            child: Image.asset(
              imageSrc,
              width: size.width * .75,
              height: size.width * .75,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
