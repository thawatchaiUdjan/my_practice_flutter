import 'package:flutter/material.dart';
import 'package:food_order_online_ui/constants.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChange;

  const SearchBox({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: kSecondaryColor.withOpacity(.32),
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: kSecondaryColor,
          ),
          hintText: "Search here",
          hintStyle: TextStyle(
            color: kSecondaryColor,
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
