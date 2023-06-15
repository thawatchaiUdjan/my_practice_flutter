import 'package:flutter/material.dart';
import 'package:movie_ui/models/movie.dart';
import 'package:movie_ui/screens/home/components/category_list.dart';
import 'package:movie_ui/screens/home/components/genre_list.dart';
import 'package:movie_ui/screens/home/components/movie_carousel.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late final TabController _tabGenreController;
  final List<String> _genres = genres;
  final List<Movie> _movies = movies;

  @override
  void initState() {
    super.initState();
    _tabGenreController = TabController(length: _genres.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryList(),
        GenresList(
          tabController: _tabGenreController,
          genreList: _genres,
        ),
        MovieCarousel(
          tabController: _tabGenreController,
          genreList: _genres,
          movieList: _movies,
        ),
      ],
    );
  }
}
