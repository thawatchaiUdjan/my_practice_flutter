import 'package:ebook_online_read_ui/constants.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  final double rate;
  const BookRating({
    Key? key,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 7),
                color: kShadowColor,
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            children: [
              Icon(
                Icons.star,
                color: kIconColor,
                size: 15,
              ),
              SizedBox(height: 5),
              Text(
                "$rate",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
