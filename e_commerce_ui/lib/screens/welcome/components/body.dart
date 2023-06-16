import 'package:e_commerce_ui/constant.dart';
import 'package:e_commerce_ui/screens/welcome/components/welcome_content.dart';
import 'package:e_commerce_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> welcomeData = [
    {
      "text": "Welcome to my Shop, Let's Go!",
      "image": "assets/images/welcome_img_2.png",
    },
    {
      "text": "So many type of shopping and customize!",
      "image": "assets/images/welcome_img_1.png",
    },
    {
      "text": "Easy and Fast for use and tranfer data Shopping.",
      "image": "assets/images/welcome_img_3.jpg",
    },
  ];

  int currPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: welcomeData.length,
                itemBuilder: (context, index) => WelcomeContent(
                  text: welcomeData[index]["text"].toString(),
                  image: welcomeData[index]["image"].toString(),
                ),
                onPageChanged: (value) => setState(() {
                  currPage = value;
                }),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      welcomeData.length,
                      (index) => buildDotSlide(index),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDotSlide(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      height: 6,
      width: currPage == index ? 25 : 6,
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: currPage == index ? kPrimaryColor : kTextLightColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
