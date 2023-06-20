import 'package:e_commerce_ui/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.popUntil(
          context, ModalRoute.withName(WelComeScreen.routeName)),
      icon: Icon(Icons.arrow_back_ios_new),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
