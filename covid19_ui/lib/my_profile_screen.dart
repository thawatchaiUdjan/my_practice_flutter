import 'package:covid19_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kTitleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
final kSubTitleTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF484848).withOpacity(.7),
);
const kBodyTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
const kSubBodyTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.normal);

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 40, 40, 20),
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  "My Profile",
                  style: kTitleTextStyle,
                ),
                SizedBox()
              ],
            ),
          ),
          //Header
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          kPrimaryColor,
                          kPrimaryColor.withOpacity(.1),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Container(
                    width: 170,
                    height: 170,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpg"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ),

          ///Body
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  Text(
                    "THAWATCHAI  UDJAN",
                    style: kTitleTextStyle.copyWith(letterSpacing: 2),
                  ),
                  Text(
                    "Programmer",
                    style: kSubTitleTextStyle,
                  ),
                  SizedBox(height: 30),
                  //Skill
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            "WEB APP",
                            style: kBodyTextStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Good",
                            style: kBodyTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        width: 3,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black.withOpacity(.1),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "MOBILE APP",
                            style: kBodyTextStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Good",
                            style: kBodyTextStyle.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Contract
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContractIcon(icon: FontAwesomeIcons.facebookF),
                      ContractIcon(icon: FontAwesomeIcons.instagram),
                      ContractIcon(icon: FontAwesomeIcons.twitter),
                    ],
                  ),
                  //Info Detail
                  Container(
                    child: Text(
                      "I'm programmer that design from requirement. For example Web application and Mobile Appication from Flutter or Android studio.",
                      style: kSubBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width - 120,
                    height: 3,
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(30)),
                  )
                ],
              ),
            ),
            //Footer
          ),
        ],
      ),
    );
  }
}

class ContractIcon extends StatelessWidget {
  final IconData icon;
  const ContractIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: FaIcon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size s) {
    var controlPoint1 = Offset(s.width / 2, s.height - 100);
    var controlPoint2 = Offset(s.width - 90, s.height);
    var endPoint = Offset(s.width, s.height - 50);
    var path = Path()
      ..lineTo(0, s.height - 50)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..lineTo(s.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
