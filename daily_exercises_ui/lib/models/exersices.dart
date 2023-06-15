import 'package:daily_exercises_ui/constants.dart';
import 'package:flutter/material.dart';

class Exercises {
  final String title;
  final String duration;
  final List<int> session;
  final String imageIcon;
  final String imageBg;
  final Color colorBg;
  final Color colorIcon;

  Exercises({
    required this.title,
    required this.duration,
    required this.session,
    required this.imageIcon,
    required this.imageBg,
    required this.colorBg,
    required this.colorIcon,
  });
}

final List<Exercises> exercises = exercisesData
    .map((item) => Exercises(
          title: item["title"].toString(),
          duration: item["duration"].toString(),
          session: List<int>.generate(
            int.parse(item["session"].toString()),
            (index) => index,
          ),
          imageIcon: item["imageIcon"].toString(),
          imageBg: item["imageBg"].toString(),
          colorBg: Color(int.parse(item["colorBg"].toString())),
          colorIcon: Color(int.parse(item["colorIcon"].toString())),
        ))
    .toList();

var exercisesData = [
  {
    "title": "Diet Recommentdation",
    "duration": "3-10",
    "session": 6,
    "imageIcon": "Hamburger.svg",
    "imageBg": "meditation_bg.png",
    "colorBg": kGreenLightColor.value,
    "colorIcon": kGreenColor.value,
  },
  {
    "title": "Kagel Exercises",
    "duration": "3-8",
    "session": 5,
    "imageIcon": "Excrecises.svg",
    "imageBg": "meditation_bg.png",
    "colorBg": kBlueLightColor.value,
    "colorIcon": kBlueColor.value,
  },
  {
    "title": "Meditation",
    "duration": "5-12",
    "session": 7,
    "imageIcon": "Meditation.svg",
    "imageBg": "meditation_bg.png",
    "colorBg": kPinkLightColor.value,
    "colorIcon": kPinkColor.value,
  },
  {
    "title": "Yoga",
    "duration": "6-15",
    "session": 8,
    "imageIcon": "yoga.svg",
    "imageBg": "meditation_bg.png",
    "colorBg": kVioletLightColor.value,
    "colorIcon": kVioletColor.value,
  },
];
