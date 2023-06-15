import 'package:covid19_ui/constants.dart';
import 'package:flutter/material.dart';

class Couter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const Couter({
    Key? key,
    required this.number,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(5),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(.26),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: color, width: 2),
              ),
            ),
          ),
          Tooltip(
            message: number.toString(),
            child: Text.rich(
              TextSpan(
                text: number.toString(),
                style: TextStyle(
                  fontSize: 32,
                  color: color,
                ),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            title,
            style: kSubTextStyle,
          ),
        ],
      ),
    );
  }
}
