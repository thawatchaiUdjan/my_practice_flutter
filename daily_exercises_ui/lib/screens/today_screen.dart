import 'package:daily_exercises_ui/constants.dart';
import 'package:daily_exercises_ui/models/exersices.dart';
import 'package:daily_exercises_ui/widgets/category_card.dart';
import 'package:flutter/material.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Text("Today Screen"),
    );
  }
}
