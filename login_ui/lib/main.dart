import 'package:flutter/material.dart';
import 'package:login_ui/constants.dart';
import 'package:login_ui/signin_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 35,
            color: kBackgroundColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          headline2: TextStyle(
            fontSize: 30,
            color: kBackgroundColor,
            fontWeight: FontWeight.normal,
          ),
          headline3: TextStyle(
            fontSize: 25,
            color: kBackgroundColor,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(
            fontSize: 15,
            color: kSecondColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kBackgroundColor.withOpacity(.5)),
            ),
            hintStyle: TextStyle(color: kBackgroundColor.withOpacity(.8))),
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
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
            flex: 3,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30, bottom: 50),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "WELCOME TO APP\n",
                            style: Theme.of(context).textTheme.headline1),
                        TextSpan(
                          text: "YOU CAN DO IT",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: SignInScreen(),
                        type: PageTransitionType.bottomToTop,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(25, 13, 15, 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kBackgroundColor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "GET START",
                            style: Theme.of(context).textTheme.button,
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.navigate_next,
                            color: kSecondColor,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
