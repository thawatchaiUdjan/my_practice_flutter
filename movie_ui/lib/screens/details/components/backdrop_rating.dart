import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_ui/components/rate_this.dart';
import 'package:movie_ui/constants.dart';
import 'package:movie_ui/models/movie.dart';

class BackDropAndRating extends StatelessWidget {
  const BackDropAndRating({
    Key? key,
    required Movie movie,
  })  : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .4,
      child: Stack(
        children: [
          Container(
            height: size.height * .4 - 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_movie.backdrop),
                fit: BoxFit.cover,
              ),
              boxShadow: [kDefaultShadow],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * .85,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                boxShadow: [kDefaultShadow],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      SizedBox(height: 5),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "${_movie.rating}/10\n",
                              style: kBodyHeadTextStyle,
                            ),
                            TextSpan(
                              text: NumberFormat("#,###")
                                  .format(_movie.numOfRatings),
                              style: kSubHeadTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RateThisBtn(),
                      Text("Rate This", style: kBodyHeadTextStyle),
                      Text("")
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color(0xFF51CF66),
                        ),
                        child: Text(
                          "${_movie.metascoreRating}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Metascore", style: kBodyHeadTextStyle),
                      SizedBox(height: 3),
                      Text(
                        "${_movie.criticsReview} critic reviews",
                        style: kSubHeadTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SafeArea(child: BackButton(color: Colors.white)),
        ],
      ),
    );
  }
}
