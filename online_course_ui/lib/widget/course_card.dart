import 'package:flutter/material.dart';
import 'package:online_course_ui/constants.dart';
import 'package:online_course_ui/details_screen.dart';
import 'package:online_course_ui/model/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final int index;
  const CourseCard({
    required this.course,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsScreen(course: course)),
      ),
      child: Hero(
        tag: 'course-image-${course.image}',
        child: Container(
          padding: EdgeInsets.all(20),
          height: index.isEven ? 200 : 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage("assets/images/${course.image}"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.name,
                style: kTitleTextStyle,
              ),
              SizedBox(height: 5),
              Text(
                "${course.numOfCourses} Courses",
                style: kSubTitleTextStyle.copyWith(color: kTextLightColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
