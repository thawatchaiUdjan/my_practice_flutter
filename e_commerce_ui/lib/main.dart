import 'package:e_commerce_ui/constant.dart';
import 'package:e_commerce_ui/routes.dart';
import 'package:e_commerce_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: WelComeScreen.routeName,
      routes: routes,
    );
  }
}
