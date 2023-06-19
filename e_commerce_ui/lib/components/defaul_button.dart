import 'package:flutter/material.dart';

import '../constant.dart';
import '../size_config.dart';

class DefaulButton extends StatelessWidget {
  const DefaulButton({
    Key? key,
    required this.textBtn,
    required this.onPress,
  }) : super(key: key);

  final String textBtn;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProporScreenHeight(45),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          textBtn,
          style: TextStyle(
            fontSize: getProporScreenWidth(10),
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        onPressed: onPress(),
      ),
    );
  }
}
