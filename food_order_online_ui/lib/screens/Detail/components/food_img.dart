import 'package:flutter/material.dart';

class FoodImage extends StatelessWidget {
  final String imageSrc;
  const FoodImage({
    Key? key,
    required this.imageSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height * .5));
        },
        blendMode: BlendMode.dstOut,
        child: Image.asset(
          "assets/images/$imageSrc",
          fit: BoxFit.cover,
          height: size.height * .4,
        ),
      ),
    );
  }
}
