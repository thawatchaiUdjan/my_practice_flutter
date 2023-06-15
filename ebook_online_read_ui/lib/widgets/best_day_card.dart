import 'package:ebook_online_read_ui/constants.dart';
import 'package:ebook_online_read_ui/models/book.dart';
import 'package:ebook_online_read_ui/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BestOfDayCard extends StatelessWidget {
  final Book book;

  const BestOfDayCard({
    Key? key,
    required this.size,
    required this.book,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170 + 20,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 170,
              width: double.infinity,
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
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/book-3.png",
              width: 140,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 37,
              width: size.width * .3,
              decoration: BoxDecoration(
                color: kBlackColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Text(
                "Read",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              width: size.width * .53,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New York Time Best For 11th March 2020",
                    style: TextStyle(
                      fontSize: 11,
                      color: kLightBlackColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${book.title}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${book.auth}",
                    style: TextStyle(
                      color: kLightBlackColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      BookRating(rate: book.rate),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "\t\tLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown",
                          style: TextStyle(
                            fontSize: 12,
                            color: kLightBlackColor,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
