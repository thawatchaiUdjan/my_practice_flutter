import 'package:flutter/material.dart';
import 'package:movie_ui/constants.dart';
import 'package:movie_ui/models/movie.dart';
import 'package:movie_ui/screens/details/components/genra_list.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({
    Key? key,
    required Movie movie,
  })  : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _movie.title,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    Text.rich(
                      TextSpan(
                        style: kDetailTextStyle.copyWith(wordSpacing: 12),
                        children: [
                          TextSpan(text: "${_movie.year} "),
                          TextSpan(text: "PG-13 "),
                          TextSpan(text: "${_movie.time}"),
                          WidgetSpan(child: SizedBox(width: 3)),
                          TextSpan(text: "min."),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: 60,
                child: TextButton(
                  child: Icon(Icons.add),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    primary: kSecondaryColor.withOpacity(.7),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding / 2),
          Genres(movie: _movie),
        ],
      ),
    );
  }
}
