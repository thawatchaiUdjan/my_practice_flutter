import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course_ui/constants.dart';
import 'package:online_course_ui/details_screen.dart';
import 'package:online_course_ui/model/course.dart';
import 'package:online_course_ui/widget/course_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Course UI',
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/icons/menu.png",
                  scale: 1.9,
                ),
                Icon(
                  Icons.supervised_user_circle,
                  size: 45,
                  color: Colors.black.withOpacity(.7),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Hey Non,", style: kHeadingTextStyle),
                    TextSpan(
                      text: "\nFind a course you want to learn",
                      style: kSubHeadingTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            //Search Box
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kSearchBoxColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for anything",
                  hintStyle: kHintTextStyle,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(.5),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            //Titile text
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: kTitleTextStyle,
                  ),
                  Text(
                    "See All",
                    style: kSubTitleTextStyle.copyWith(color: kBlueColor),
                  ),
                ],
              ),
            ),
            //Category box card
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: coursesData.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) =>
                    CourseCard(course: coursesData[index], index: index),
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
