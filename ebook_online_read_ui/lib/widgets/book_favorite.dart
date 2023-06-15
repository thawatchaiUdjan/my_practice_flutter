import 'package:ebook_online_read_ui/constants.dart';
import 'package:flutter/material.dart';

class BookFavorite extends StatefulWidget {
  const BookFavorite({
    Key? key,
  }) : super(key: key);

  @override
  _BookFavoriteState createState() => _BookFavoriteState();
}

class _BookFavoriteState extends State<BookFavorite> {
  var isFavorait = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorait ? Icons.favorite : Icons.favorite_border,
        color: isFavorait ? kFavoriteIconColor : Colors.black,
      ),
      onPressed: () => setState(() {
        isFavorait ^= true;
      }),
    );
  }
}
