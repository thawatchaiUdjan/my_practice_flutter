import 'package:flutter/material.dart';
import 'package:food_order_online_ui/constants.dart';
import 'package:food_order_online_ui/screens/Home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Order Online App UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: kPrimaryColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          bodyText2: TextStyle(
            color: kSecondaryColor,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
