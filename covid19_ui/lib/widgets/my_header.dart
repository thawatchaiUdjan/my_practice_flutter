import 'package:covid19_ui/constants.dart';
import 'package:covid19_ui/my_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  const MyHeader({
    Key? key,
    required this.image,
    required this.textTop,
    required this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: 320,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              kPrimaryColor,
              kSecondaryColor,
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/bg-virus.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: MyProfile(),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/icons/menu.png",
                    scale: 1.7,
                    color: kWhiteColor,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: Image.asset("assets/images/$image"),
                    ),
                    Positioned(
                      top: 40,
                      left: 190,
                      child: Text(
                        "$textTop \n$textBottom",
                        style: kHeadingTextStyle.copyWith(color: kWhiteColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 3, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
