import 'package:ebook_online_read_ui/constants.dart';
import 'package:ebook_online_read_ui/screens/home_screen.dart';
import 'package:ebook_online_read_ui/widgets/rounded_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Book Reading App UI',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: kBlackColor,
            ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: kBlackColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bitmap.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                style: Theme.of(context).textTheme.headline3,
                children: [
                  TextSpan(
                    text: "Welcome",
                  ),
                  TextSpan(
                    text: "go.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: RoundedButton(
                text: "Get Reading",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
