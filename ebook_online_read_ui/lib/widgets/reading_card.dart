import 'package:ebook_online_read_ui/constants.dart';
import 'package:ebook_online_read_ui/models/book.dart';
import 'package:ebook_online_read_ui/widgets/book_favorite.dart';
import 'package:ebook_online_read_ui/widgets/book_rating.dart';
import 'package:ebook_online_read_ui/widgets/twoside_rounded_btn.dart';
import 'package:flutter/material.dart';

class ReadingCard extends StatefulWidget {
  final Book book;
  final Function pressDetail;
  final Function pressRead;
  const ReadingCard({
    Key? key,
    required this.book,
    required this.pressDetail,
    required this.pressRead,
  }) : super(key: key);

  @override
  _ReadingCardState createState() => _ReadingCardState();
}

class _ReadingCardState extends State<ReadingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170 + 20,
      height: 220 + 20,
      margin: EdgeInsets.only(left: 25),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: 170,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor,
                    blurRadius: 30,
                  ),
                ],
              ),
            ),
          ),
          Hero(
              tag: 'book-image-${widget.book.image}',
              child: Image.asset("assets/images/${widget.book.image}",
                  width: 150)),
          Positioned(
            right: 10,
            top: 30,
            child: Column(
              children: [
                BookFavorite(),
                BookRating(rate: widget.book.rate),
              ],
            ),
          ),
          Positioned(
            top: 160,
            left: 20,
            child: Container(
              width: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.book.title}",
                    style: TextStyle(
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3),
                  Text(
                    "${widget.book.auth}",
                    style: TextStyle(color: kLightBlackColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => widget.pressDetail(),
                      child: Container(
                        child: Center(
                          child: Text("Detail"),
                        ),
                      ),
                    ),
                  ),
                  TwoRoundedBtn(
                    text: "Read",
                    press: () => widget.pressRead(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
