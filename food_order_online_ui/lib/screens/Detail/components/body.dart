import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order_online_ui/models/food.dart';
import 'package:food_order_online_ui/screens/Detail/components/food_img.dart';
import 'package:food_order_online_ui/screens/Detail/components/food_info.dart';

class Body extends StatelessWidget {
  final Food food;
  const Body({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        FoodImage(imageSrc: food.image.toString()),
        FoodInfo(food: food),
      ],
    );
  }
}
