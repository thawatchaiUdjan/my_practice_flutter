import 'package:daily_exercises_ui/constants.dart';
import 'package:daily_exercises_ui/models/exersices.dart';
import 'package:daily_exercises_ui/widgets/search_bar.dart';
import 'package:daily_exercises_ui/widgets/session_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
  final Exercises exer;
  const DetailScreen({Key? key, required this.exer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [exer.colorBg, Colors.white],
              ),
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage(
                  "assets/images/${exer.imageBg}",
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exer.title,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${exer.duration} MIN Course",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: size.width * .6,
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: SearchBar(),
                    ),
                    SizedBox(height: size.height * .03),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        ...exer.session.map(
                          (item) => SessionCard(exer: exer, number: item + 1),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      exer.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 90,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            spreadRadius: -10,
                            color: kShadowColor,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Hamburger.svg",
                            width: 100,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Basic 2",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 16),
                                  ),
                                  Text("Start your deepen you practice"),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, right: 15),
                              child: Icon(
                                Icons.lock_outline,
                                color: kTextColor.withOpacity(.75),
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
          ),
        ],
      ),
    );
  }
}
