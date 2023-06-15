import 'package:ebook_online_read_ui/constants.dart';
import 'package:ebook_online_read_ui/models/book.dart';
import 'package:ebook_online_read_ui/widgets/book_rating.dart';
import 'package:ebook_online_read_ui/widgets/rounded_btn.dart';
import 'package:flutter/material.dart';

class MayLikeBookCard extends StatelessWidget {
  final Book book;
  const MayLikeBookCard({
    required this.book,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 180,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 165,
              padding: EdgeInsets.only(
                left: 25,
                top: 20,
                bottom: 15,
                right: size.width * .36,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFFF8F9),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${book.title}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${book.auth}",
                    style: TextStyle(
                      color: kLightBlackColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      BookRating(rate: book.rate),
                      SizedBox(width: 15),
                      Expanded(
                        child: RoundedButton(
                          text: "Read",
                          paddVerti: 10,
                          press: () => {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/book-1.png",
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
