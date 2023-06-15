import 'package:flutter/material.dart';
import 'package:movie_ui/components/genra_card.dart';
import 'package:movie_ui/constants.dart';
import 'package:movie_ui/models/movie.dart';

class Genres extends StatelessWidget {
  const Genres({
    Key? key,
    required Movie movie,
  })  : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ListView.builder(
        itemCount: _movie.genra.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: kDefaultPadding / 2),
          child: GenraCard(
            title: _movie.genra[index],
          ),
        ),
      ),
    );
  }
}
