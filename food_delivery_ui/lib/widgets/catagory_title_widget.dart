import 'package:flutter/material.dart';

class CatagoryTitle extends StatelessWidget {
  final String title;
  const CatagoryTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
