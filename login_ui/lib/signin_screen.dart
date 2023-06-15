import 'package:flutter/material.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/signup_screen.dart';
import 'package:page_transition/page_transition.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background_wel.jpg'),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SIGN IN",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          PageTransition(
                            child: SignUpScreen(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        ),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: Text("SIGN UP",
                              style: Theme.of(context).textTheme.button),
                          decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Icon(
                                Icons.alternate_email,
                                color: kSecondColor,
                                size: 28,
                              ),
                            ),
                            Flexible(
                              child: TextField(
                                decoration:
                                    InputDecoration(hintText: "E-mail Address"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Icon(
                                Icons.lock,
                                color: kSecondColor,
                                size: 28,
                              ),
                            ),
                            Flexible(
                              child: TextField(
                                decoration:
                                    InputDecoration(hintText: "Password"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 80),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white.withOpacity(.7)),
                              ),
                              child: Icon(
                                Icons.android,
                                color: Colors.white.withOpacity(.7),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white.withOpacity(.7)),
                              ),
                              child: Icon(
                                Icons.chat,
                                color: Colors.white.withOpacity(.7),
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: kBackgroundColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.login,
                                color: kSecondColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
