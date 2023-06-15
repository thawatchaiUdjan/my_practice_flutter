import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';

class GenraCard extends StatelessWidget {
  final String title;
  const GenraCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: kDefaultPadding / 1.5,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(title),
    );
  }
}
