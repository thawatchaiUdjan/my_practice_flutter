import 'package:e_commerce_ui/components/back_arrow_button.dart';
import 'package:e_commerce_ui/screens/sign_In/components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  static String ronteName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Sign In"),
          leading: BackArrowButton(),
        ),
        body: Body(),
      ),
    );
  }
}
