import 'package:flutter/material.dart';
import 'package:online_course_ui/constants.dart';
import 'package:online_course_ui/model/course.dart';
import 'package:online_course_ui/widget/course_content.dart';

class DetailsScreen extends StatefulWidget {
  final Course course;
  DetailsScreen({required this.course});

  @override
  _DetailsScreenState createState() => _DetailsScreenState(course);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final Course _course;
  _DetailsScreenState(this._course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          //Background image
          Hero(
            tag: 'course-image-${_course.image}',
            child: Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/${_course.image}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          //Header
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 35, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.maybePop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kLightBlackColor,
                      ),
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 30,
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(height: 20),
                ClipPath(
                  clipper: BestSellerClipper(),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 14),
                    padding:
                        EdgeInsets.only(left: 10, top: 5, right: 20, bottom: 5),
                    color: kBestSellerColor,
                    child: Text(
                      "best seller".toUpperCase(),
                      style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(_course.title, style: kHeadingTextStyle),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5),
                      Text(
                        _course.views,
                        style: kSubTitleTextStyle.copyWith(color: Colors.black),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.star, color: kBestSellerColor),
                      SizedBox(width: 5),
                      Text(
                        _course.rating.toString(),
                        style: kSubTitleTextStyle.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "\$${calPriceDiscout(
                            _course.price,
                            _course.persentDiscout,
                          )}  ",
                          style: kHeadingTextStyle.copyWith(fontSize: 30),
                        ),
                        _course.persentDiscout != 0
                            ? TextSpan(
                                text: "\$${_course.price}",
                                style: kDiscountTextStyle)
                            : TextSpan(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Course content
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 75,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(left: 30, top: 30, bottom: 370),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Course Content", style: kHeadingTextStyle),
                  SizedBox(height: 20),
                  buildContentListView(_course),
                ],
              ),
            ),
          ),
          //Footer Buy now
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 30,
                    color: Colors.black.withOpacity(.15),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    decoration: BoxDecoration(
                      color: kBlueColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: kBlueColor,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        "Buy Now",
                        style: kTitleTextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var mg = 14.0;
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, (size.height - mg) / 2);
    path.lineTo(size.width - 20, size.height - mg);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

Widget buildContentListView(Course _course) {
  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: _course.numOfCourses,
      itemBuilder: (context, index) => CourseContent(
        number: index + 1,
        duration: 5.32,
        title: "Course name : ${index + 1}",
      ),
    ),
  );
}

int calPriceDiscout(int price, int pst) {
  return pst == 0 ? price : price - (price * (pst / 100)).toInt();
}
