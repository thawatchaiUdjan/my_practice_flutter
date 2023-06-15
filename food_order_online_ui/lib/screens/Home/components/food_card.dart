import 'package:flutter/material.dart';
import 'package:food_order_online_ui/constants.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String shopName;
  final String image;
  final Function onPress;
  const FoodCard({
    Key? key,
    required this.title,
    required this.shopName,
    required this.image,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 25, right: 20),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            color: kShadowColor.withOpacity(.5),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () => onPress(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(.3),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    "assets/icons/$image",
                    height: size.height * .095,
                  ),
                ),
                Spacer(),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                Text(shopName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
