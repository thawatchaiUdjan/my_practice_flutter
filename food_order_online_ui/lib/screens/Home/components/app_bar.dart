import 'package:flutter/material.dart';
import 'package:food_order_online_ui/constants.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: kSecondaryColor,
        size: 35,
      ),
      onPressed: () {},
    ),
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Non",
            style: TextStyle(
              color: kSecondaryColor,
            ),
          ),
          TextSpan(
            text: "Food",
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        icon: Icon(
          Icons.notifications_none_outlined,
          color: kSecondaryColor,
          size: 30,
        ),
        onPressed: () {},
      ),
    ],
  );
}
