import 'package:ebook_online_read_ui/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color tColor;
  final Color bgColor;
  final double fSize;
  final Function press;
  final double paddVerti;

  const RoundedButton({
    Key? key,
    required this.text,
    this.fSize = 16,
    required this.press,
    this.tColor = kBlackColor,
    this.bgColor = Colors.white,
    this.paddVerti = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: double.infinity),
        child: ElevatedButton(
          onPressed: () => press(),
          style: ElevatedButton.styleFrom(
            primary: bgColor,
            onPrimary: tColor,
            padding: EdgeInsets.symmetric(vertical: paddVerti, horizontal: 30),
            shape: StadiumBorder(),
            elevation: 5,
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: fSize),
          ),
        ),
      ),
    );
  }
}
