import 'package:flutter/material.dart';
import 'package:food_order_online_ui/constants.dart';
import 'package:food_order_online_ui/models/food.dart';
import 'package:food_order_online_ui/screens/Detail/components/app_bar.dart';
import 'package:food_order_online_ui/screens/Detail/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Food food;
  const DetailsScreen({required this.food, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: detailAppBar(context),
      body: Body(food: food),
    );
  }
}
