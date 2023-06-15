import 'package:flutter/material.dart';
import 'package:login_ui/constants.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    child: Text(
                      "SIGN UP",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    decoration: BoxDecoration(
                      color: kSecondColor.withOpacity(.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  SizedBox(height: 40),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
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
                                  decoration: InputDecoration(
                                      hintText: "E-mail Address"),
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
                          Padding(
                            padding: const EdgeInsets.only(top: 50, bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () => onTapSignUp(context),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 50),
                                    decoration: BoxDecoration(
                                      color: kSecondColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Text(
                                      "SIGN UP!",
                                      style: TextStyle(
                                          color: kThirdColor, fontSize: 20),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapSignUp(context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Success REGISTERED !!")));
    Navigator.maybePop(context);
  }
}
