import 'package:ebook_online_read_ui/constants.dart';
import 'package:ebook_online_read_ui/models/book.dart';
import 'package:flutter/material.dart';

class ContiReadCard extends StatelessWidget {
  final Book book;
  const ContiReadCard({
    Key? key,
    required this.size,
    required this.book,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: kShadowColor, blurRadius: 30),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/${book.image}",
                      width: 60,
                    ),
                    SizedBox(width: 10),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(color: kBlackColor),
                        children: [
                          TextSpan(
                            text: "${book.title}\n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "${book.auth}\n\n",
                            style: TextStyle(
                              fontSize: 13,
                              color: kLightBlackColor,
                            ),
                          ),
                          TextSpan(
                            text: "Chapter 7 of 10",
                            style: TextStyle(
                              color: kLightBlackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width * 7 / 10,
              height: 5,
              decoration: BoxDecoration(
                color: kProgressIndicator,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
