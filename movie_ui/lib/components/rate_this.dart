import 'package:flutter/material.dart';

class RateThisBtn extends StatefulWidget {
  const RateThisBtn({
    Key? key,
  }) : super(key: key);

  @override
  _RateThisBtnState createState() => _RateThisBtnState();
}

class _RateThisBtnState extends State<RateThisBtn> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isActive ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
      iconSize: 30,
      color: isActive ? Colors.amber : Colors.black54,
      onPressed: () => setState(() {
        isActive ^= true;
      }),
    );
  }
}
