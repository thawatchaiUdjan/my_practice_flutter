import 'package:flutter/material.dart';
import 'package:food_order_online_ui/constants.dart';
import 'package:food_order_online_ui/screens/Home/components/app_bar.dart';
import 'package:food_order_online_ui/screens/Home/components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> itemsScreen = [
    Body(),
    Center(child: Text("Favorite")),
    Center(child: Text("Navigate")),
    Center(child: Text("Profile")),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: bottomNavBar(),
      body: itemsScreen[_currentIndex],
    );
  }

  Container bottomNavBar() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -7),
            color: kShadowColor.withOpacity(.5),
            blurRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconSize: 30,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 0 ? Icons.home : Icons.home_outlined,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 1 ? Icons.favorite : Icons.favorite_outline,
            ),
            label: "favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 2 ? Icons.explore : Icons.explore_outlined,
            ),
            label: "navigate",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 3 ? Icons.person : Icons.person_outline,
            ),
            label: "profile",
          ),
        ],
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}
