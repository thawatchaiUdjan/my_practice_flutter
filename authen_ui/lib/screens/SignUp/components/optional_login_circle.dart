import 'package:authen_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionalLoginCircle extends StatelessWidget {
  final String icon;
  final Function onPress;
  const OptionalLoginCircle({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: kPrimaryLightColor,
            width: 2,
          ),
        ),
        child: SvgPicture.asset(
          "assets/icons/$icon",
          width: 20,
          height: 20,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
