import 'package:e_commerce_ui/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce_ui/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  WelComeScreen.routeName: (context) => WelComeScreen(),
  SignInScreen.ronteName: (context) => SignInScreen(),
};
