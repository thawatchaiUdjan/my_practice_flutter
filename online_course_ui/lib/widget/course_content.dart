import 'package:flutter/material.dart';
import 'package:online_course_ui/constants.dart';

class CourseContent extends StatelessWidget {
  final int number;
  final double duration;
  final String title;
  final bool isDone;

  const CourseContent({
    Key? key,
    required this.number,
    required this.duration,
    required this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Container(
            width: 55,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10),
            child: Text(
              number.toString().padLeft(2, '0'),
              style: kHeadingTextStyle.copyWith(
                color: kTextLightColor.withOpacity(.5),
                fontSize: 28,
              ),
            ),
          ),
          Container(
            width: 230,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "$duration mins\n",
                    style: kHeadingTextStyle.copyWith(
                      color: kTextLightColor.withOpacity(.5),
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: title,
                    style: kTitleTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.only(left: 80),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(isDone ? .5 : 1),
            ),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
