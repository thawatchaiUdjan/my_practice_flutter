import 'package:covid19_ui/constants.dart';
import 'package:flutter/material.dart';

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key? key,
    required this.image,
    required this.title,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  color: kActiveShadowColor,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                )
              : BoxShadow(
                  color: kShadowColor,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
        ],
      ),
      child: Column(
        children: [
          Image.asset("assets/images/$image"),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
