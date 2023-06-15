import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';
import 'package:movie_ui/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      leading: IconButton(
        icon: Icon(Icons.menu),
        padding: EdgeInsets.only(left: kDefaultPadding),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          padding: EdgeInsets.only(right: kDefaultPadding),
          onPressed: () {},
        )
      ],
    );
  }
}
