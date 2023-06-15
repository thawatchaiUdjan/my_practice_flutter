import 'package:flutter/material.dart';
import 'package:movie_ui/components/genra_card.dart';
import 'package:movie_ui/constants.dart';

class GenresList extends StatelessWidget {
  final TabController _tabGenreController;
  final List<String> _genres;

  const GenresList({
    Key? key,
    required TabController tabController,
    required List<String> genreList,
  })  : _tabGenreController = tabController,
        _genres = genreList,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: kDefaultPadding,
        left: kDefaultPadding,
      ),
      child: TabBar(
        controller: _tabGenreController,
        isScrollable: true,
        physics: BouncingScrollPhysics(),
        indicatorColor: Colors.transparent,
        labelColor: kTextColor,
        unselectedLabelColor: kTextLightColor,
        labelPadding: EdgeInsets.only(right: kDefaultPadding),
        tabs: [..._genres.map((title) => GenraCard(title: title)).toList()],
      ),
    );
  }
}
