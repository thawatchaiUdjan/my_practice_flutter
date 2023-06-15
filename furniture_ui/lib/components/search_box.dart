import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChange;
  const SearchBox({
    Key? key,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
        ),
        onChanged: onChange,
      ),
    );
  }
}
