import 'package:online_course_ui/data.dart';

class Course {
  final String name;
  final int numOfCourses;
  final String image;
  final String title;
  final String views;
  final double rating;
  final int price;
  final int persentDiscout;

  Course({
    required this.name,
    required this.numOfCourses,
    required this.image,
    required this.title,
    required this.views,
    required this.rating,
    required this.price,
    required this.persentDiscout,
  });
}

List<Course> coursesData = courses
    .map((item) => Course(
          name: item['name'].toString(),
          numOfCourses: int.parse(item['courses'].toString()),
          image: item['image'].toString(),
          title: item['title'].toString(),
          views: item['views'].toString(),
          rating: double.parse(item['rating'].toString()),
          price: int.parse(item['price'].toString()),
          persentDiscout: int.parse(item['persentDiscout'].toString()),
        ))
    .toList();
