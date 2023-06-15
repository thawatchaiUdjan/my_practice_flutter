import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';

class CastAndCrewCard extends StatelessWidget {
  final cast;

  const CastAndCrewCard({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(cast["image"]),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: kDefaultPadding / 3),
          Text(
            cast["orginalName"],
            style: kDetailTextStyle.copyWith(color: kTextColor),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(height: 5),
          Text(
            cast["movieName"],
            style: kSubHeadTextStyle,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
