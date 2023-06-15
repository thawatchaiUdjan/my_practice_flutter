import 'package:daily_exercises_ui/constants.dart';
import 'package:daily_exercises_ui/models/exersices.dart';
import 'package:daily_exercises_ui/screens/exercises_screen.dart';
import 'package:daily_exercises_ui/screens/setting_screen.dart';
import 'package:daily_exercises_ui/screens/today_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Exercises App UI',
      theme: ThemeData(
        fontFamily: GoogleFonts.cairo().fontFamily,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  var tabs = [
    TodayScreen(),
    ExercisesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: kActiveIconColor,
        items: [
          bottomNavItem("Today", "calendar.svg", 0),
          bottomNavItem("Excrecise", "gym.svg", 1),
          bottomNavItem("Settings", "Settings.svg", 2),
        ],
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }

  BottomNavigationBarItem bottomNavItem(
      String title, String imageIcon, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/$imageIcon",
        color: _currentIndex == index ? kActiveIconColor : kTextColor,
      ),
      title: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(title),
      ),
    );
  }
}
