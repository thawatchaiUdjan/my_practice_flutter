import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';
import 'package:movie_ui/models/movie.dart';
import 'package:movie_ui/screens/details/details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie _movie;

  const MovieCard({
    Key? key,
    required movie,
  })  : _movie = movie,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(movie: _movie)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_movie.poster),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [kDefaultShadow],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kDefaultPadding,
                bottom: kDefaultPadding / 4,
              ),
              child: Text(
                _movie.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 5),
                Text(
                  "${_movie.rating}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: kTextLightColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
