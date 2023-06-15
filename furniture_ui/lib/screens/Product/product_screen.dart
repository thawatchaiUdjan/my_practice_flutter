import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';
import 'package:furniture_ui/screens/Product/components/body.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        "Dashboard",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
