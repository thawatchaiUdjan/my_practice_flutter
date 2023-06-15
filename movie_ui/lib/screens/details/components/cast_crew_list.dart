import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';
import 'package:movie_ui/models/movie.dart';
import 'package:movie_ui/screens/details/components/cast_crew_card.dart';

class CastAndCrewList extends StatelessWidget {
  const CastAndCrewList({
    Key? key,
    required Movie movie,
  })  : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast & Crew",
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: kDefaultPadding / 1.5),
          SizedBox(
            height: 140,
            child: ListView.builder(
              itemCount: _movie.cast.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding / 4),
                child: CastAndCrewCard(cast: _movie.cast[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
