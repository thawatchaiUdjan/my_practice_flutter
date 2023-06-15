import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';
import 'package:movie_ui/models/movie.dart';
import 'package:movie_ui/screens/home/components/movie_card.dart';

import 'dart:math' as math;

class MovieCarousel extends StatefulWidget {
  final TabController _tabGenreController;
  final List<String> _genres;
  final List<Movie> _movies;

  const MovieCarousel({
    Key? key,
    required TabController tabController,
    required List<String> genreList,
    required List<Movie> movieList,
  })  : _tabGenreController = tabController,
        _genres = genreList,
        _movies = movieList,
        super(key: key);

  @override
  _MovieCarouselState createState() =>
      _MovieCarouselState(_tabGenreController, _genres, _movies);
}

class _MovieCarouselState extends State<MovieCarousel> {
  final TabController _tabGenreController;
  final List<String> _genres;
  final List<Movie> _movies;

  int currPage = 0;

  _MovieCarouselState(
    this._tabGenreController,
    this._genres,
    this._movies,
  );

  @override
  void dispose() {
    super.dispose();
    _tabGenreController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabGenreController.addListener(() {
      if (_tabGenreController.indexIsChanging) {
        setState(() => currPage = 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .72,
      width: 400,
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: TabBarView(
        controller: _tabGenreController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ..._genres.map((genreName) {
            final PageController _pageMovieController =
                PageController(viewportFraction: .8);
            final moviesSelect = _movies
                .where((item) => item.genra.contains(genreName))
                .toList();

            return PageView.builder(
              controller: _pageMovieController,
              itemCount: moviesSelect.length,
              physics: BouncingScrollPhysics(),
              onPageChanged: (page) => setState(() => currPage = page),
              itemBuilder: (context, index) => buildMovieList(
                index,
                moviesSelect,
                _pageMovieController,
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget buildMovieList(
    int index,
    List<Movie> moviesSelect,
    PageController _pageMovieController,
  ) {
    return AnimatedBuilder(
      animation: _pageMovieController,
      builder: (context, child) {
        double value = 0;

        if (_pageMovieController.position.haveDimensions) {
          value = index - _pageMovieController.page!.toDouble();
          value = (value * 0.038).clamp(-1, 1);
        }
        return AnimatedOpacity(
          opacity: currPage == index ? 1 : .4,
          duration: Duration(milliseconds: 350),
          child: Transform.rotate(
            angle: math.pi * value,
            child: MovieCard(movie: moviesSelect[index]),
          ),
        );
      },
    );
  }
}
