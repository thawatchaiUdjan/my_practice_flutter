import 'package:flutter/material.dart';
import 'package:food_delivery_ui/constants.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String ingredient;
  final String description;
  final int calories;
  final int price;
  final String image;

  const FoodCard({
    Key? key,
    required this.title,
    required this.ingredient,
    required this.description,
    required this.calories,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 40, bottom: 40),
      width: 260,
      height: 420,
      child: Stack(
        children: [
          //Big background light
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 240,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34),
                color: kPrimaryColor.withOpacity(.18),
              ),
            ),
          ),
          //Rounded
          Container(
            width: 185,
            height: 185,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor.withOpacity(.4),
            ),
          ),
          //Food Image
          Hero(
            tag: 'food-image-$image',
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/$image"),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          //Price
          Positioned(
            top: 80,
            right: 20,
            child: Text(
              "\$$price",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: kPrimaryColor),
            ),
          ),
          //Food Details
          Positioned(
            top: 200,
            left: 40,
            child: Container(
              width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    "With $ingredient",
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20),
                  Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: kTextColor.withOpacity(.65)),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$calories Kcal",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: kTextColor.withOpacity(1)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
