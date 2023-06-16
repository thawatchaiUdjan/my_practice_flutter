import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "NONNY",
          style: TextStyle(
            fontSize: getProporScreenWidth(30),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(text),
        Spacer(),
        Image.asset(
          image,
          width: getProporScreenWidth(270),
          height: getProporScreenHeight(260),
        ),
      ],
    );
  }
}
