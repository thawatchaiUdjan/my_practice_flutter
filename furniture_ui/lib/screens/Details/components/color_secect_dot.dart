import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';
import 'package:furniture_ui/screens/Details/components/color_dot.dart';

class ColorSelectDot extends StatefulWidget {
  const ColorSelectDot({
    Key? key,
  }) : super(key: key);

  @override
  _ColorSelectDotState createState() => _ColorSelectDotState();
}

class _ColorSelectDotState extends State<ColorSelectDot> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      renderBorder: false,
      splashColor: Colors.transparent,
      fillColor: Colors.transparent,
      children: [
        ColorDot(color: Colors.blue.shade800, isSelected: isSelected[0]),
        ColorDot(color: Colors.grey, isSelected: isSelected[1]),
        ColorDot(color: Colors.red, isSelected: isSelected[2])
      ],
      onPressed: (index) => setState(() {
        for (int buttonIndex = 0;
            buttonIndex < isSelected.length;
            buttonIndex++) {
          if (buttonIndex == index) {
            isSelected[buttonIndex] = true;
          } else {
            isSelected[buttonIndex] = false;
          }
        }
      }),
      isSelected: isSelected,
    );
  }
}
