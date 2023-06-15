import 'package:authen_ui/components/rounded_btn.dart';
import 'package:authen_ui/constants.dart';
import 'package:authen_ui/screens/Login/login_screen.dart';
import 'package:authen_ui/screens/SignUp/signup_screen.dart';
import 'package:authen_ui/screens/welcome/components/background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to my app".toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: size.height * .1),
          Image.asset(
            "assets/images/main-bg.png",
            height: size.height * .45,
          ),
          SizedBox(height: size.height * .07),
          RoundedButton(
            text: "LOGIN",
            txtColor: Colors.white,
            bgColor: kPrimaryColor,
            onPress: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            ),
          ),
          RoundedButton(
            text: "SIGNUP",
            txtColor: Colors.black,
            bgColor: kPrimaryLightColor,
            onPress: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
              (route) => false,
            ),
          ),
        ],
      ),
    );
  }
}
