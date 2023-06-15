import 'package:authen_ui/components/already_have_account_check_text.dart';
import 'package:authen_ui/components/email_rounded_field.dart';
import 'package:authen_ui/components/password_rounded_field.dart';
import 'package:authen_ui/components/rounded_btn.dart';
import 'package:authen_ui/components/text_field_container.dart';
import 'package:authen_ui/constants.dart';
import 'package:authen_ui/screens/Login/components/background.dart';
import 'package:authen_ui/screens/SignUp/signup_screen.dart';
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
              "login".toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: size.height * .1),
            Image.asset(
              "assets/images/login-bg.png",
              height: size.height * .35,
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
              text: "LOGIN",
              bgColor: kPrimaryColor,
              txtColor: Colors.white,
              onPress: () {},
            ),
            SizedBox(height: size.height * .03),
            AlreadyHaveAnAccountCheck(
              onPress: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
                (route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
