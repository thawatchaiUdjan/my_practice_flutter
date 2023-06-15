import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';
import 'package:movie_ui/models/movie.dart';
import 'package:movie_ui/screens/details/components/backdrop_rating.dart';
import 'package:movie_ui/screens/details/components/cast_crew_list.dart';
import 'package:movie_ui/screens/details/components/genra_list.dart';
import 'package:movie_ui/screens/details/components/plot_summary.dart';
import 'package:movie_ui/screens/details/components/title_duration.dart';

class Body extends StatelessWidget {
  final Movie _movie;
  const Body({
    Key? key,
    required Movie movie,
  })  : _movie = movie,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackDropAndRating(movie: _movie),
          TitleDurationAndFabBtn(movie: _movie),
          PlotSummary(plot: _movie.plot),
          CastAndCrewList(movie: _movie),
        ],
      ),
    );
  }
}
