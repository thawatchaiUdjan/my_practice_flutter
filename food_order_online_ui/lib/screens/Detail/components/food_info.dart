import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_order_online_ui/constants.dart';
import 'package:food_order_online_ui/models/food.dart';
import 'package:food_order_online_ui/screens/Detail/components/order_now_btn.dart';
import 'package:food_order_online_ui/screens/Detail/components/title_price_rating.dart';

class FoodInfo extends StatelessWidget {
  final Food food;
  const FoodInfo({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height * .63,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            shopName(food.shopName),
            TitlePriceRating(
              name: food.title.toString(),
              rating: food.rating,
              reviews: food.reviews,
              price: food.price,
            ),
            description(food.description),
            OrderNowBtn(onPress: () {}),
          ],
        ),
      ),
    );
  }

  Expanded description(String description) {
    return Expanded(
      child: Text(
        "   ${description}",
        style: TextStyle(height: 1.8),
      ),
    );
  }

  Row shopName(String? shopName) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: kSecondaryColor,
        ),
        SizedBox(width: 10),
        Text("${shopName}"),
      ],
    );
  }
}
