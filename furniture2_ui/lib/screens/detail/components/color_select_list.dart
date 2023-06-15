import 'package:flutter/material.dart';
import 'package:furniture2_ui/constants.dart';
import 'package:furniture2_ui/size_config.dart';

class ColorSelectList extends StatefulWidget {
  const ColorSelectList({Key? key}) : super(key: key);

  @override
  State<ColorSelectList> createState() => _ColorSelectListState();
}

class _ColorSelectListState extends State<ColorSelectList> {
  int posActive = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildColorBox(1, Color(0xFF7BA275)),
        buildColorBox(2, Color(0xFFD7D7D7)),
        buildColorBox(3, kTextColor),
      ],
    );
  }

  Widget buildColorBox(int posColor, Color color) {
    double _defualtSize = SizeConfig.defaultSize;
    return InkWell(
      onTap: () => setState(() {
        posActive = posColor;
      }),
      child: Container(
        width: _defualtSize * 2.4,
        height: _defualtSize * 2.4,
        margin: EdgeInsets.only(top: _defualtSize, right: _defualtSize),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: posActive == posColor
            ? Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: _defualtSize * 1.8,
              )
            : SizedBox(),
      ),
      splashColor: kSecondaryColor,
      highlightColor: kSecondaryColor,
    );
  }
}
