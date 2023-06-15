import 'package:authen_ui/components/already_have_account_check_text.dart';
import 'package:authen_ui/components/email_rounded_field.dart';
import 'package:authen_ui/components/password_rounded_field.dart';
import 'package:authen_ui/components/rounded_btn.dart';
import 'package:authen_ui/constants.dart';
import 'package:authen_ui/screens/Login/login_screen.dart';
import 'package:authen_ui/screens/SignUp/components/background.dart';
import 'package:authen_ui/screens/SignUp/components/optional_login_circle.dart';
import 'package:authen_ui/screens/SignUp/components/or_divider.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "signup".toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: size.height * .05),
            Image.asset(
              "assets/images/signup-bg.png",
              height: size.height * .3,
            ),
            SizedBox(height: size.height * .03),
            EmailRoundField(
              icon: Icons.person,
              hintTxt: "E-mail",
              onChange: (value) {},
            ),
            PasswordRoundedField(
              onChange: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              bgColor: kPrimaryColor,
              txtColor: Colors.white,
              onPress: () {},
            ),
            SizedBox(height: size.height * .03),
            AlreadyHaveAnAccountCheck(
              login: false,
              onPress: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              ),
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OptionalLoginCircle(
                  icon: "facebook.svg",
                  onPress: () {},
                ),
                OptionalLoginCircle(
                  icon: "twitter.svg",
                  onPress: () {},
                ),
                OptionalLoginCircle(
                  icon: "google-plus.svg",
                  onPress: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
