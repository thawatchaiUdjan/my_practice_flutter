import 'package:flutter/material.dart';
import 'package:food_order_online_ui/constants.dart';

AppBar detailAppBar(BuildContext context) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: kPrimaryColor),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(icon: Icon(Icons.reply), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
