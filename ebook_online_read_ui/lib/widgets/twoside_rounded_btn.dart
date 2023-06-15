import 'package:ebook_online_read_ui/constants.dart';
import 'package:flutter/material.dart';

class TwoRoundedBtn extends StatelessWidget {
  final String text;
  final double rad;
  final Function press;
  const TwoRoundedBtn({
    Key? key,
    required this.text,
    this.rad = 30,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => press(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(rad),
              bottomRight: Radius.circular(rad),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
