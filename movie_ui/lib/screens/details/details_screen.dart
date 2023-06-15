import 'package:flutter/material.dart';
import 'package:movie_ui/models/movie.dart';
import 'package:movie_ui/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Movie _movie;
  const DetailsScreen({
    Key? key,
    required Movie movie,
  })  : _movie = movie,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(movie: _movie),
    );
  }
}
