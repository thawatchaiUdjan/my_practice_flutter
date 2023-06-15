import 'package:daily_exercises_ui/constants.dart';
import 'package:daily_exercises_ui/models/exersices.dart';
import 'package:daily_exercises_ui/screens/details_ex_screen.dart';
import 'package:daily_exercises_ui/widgets/category_card.dart';
import 'package:daily_exercises_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: size.height * .45,
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(.7),
            image: DecorationImage(
              image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Text(
                  "Good Morning\nNonny",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SearchBar(),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: .85,
                    children: [
                      ...exercises.map(
                        (item) => CategoryCard(
                          title: item.title,
                          image: item.imageIcon,
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(exer: item),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
