import 'package:flutter/material.dart';
import 'package:movie_ui/screens/Home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App UI',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: HomeScreen(),
    );
  }
}
