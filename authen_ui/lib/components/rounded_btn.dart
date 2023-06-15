import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color bgColor, txtColor;
  final Function onPress;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.txtColor,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * .85,
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: txtColor),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          primary: bgColor,
          elevation: 0,
          shape: StadiumBorder(),
        ),
        onPressed: () => onPress(),
      ),
    );
  }
}
