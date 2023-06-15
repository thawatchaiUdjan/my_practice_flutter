import 'package:ebook_online_read_ui/constants.dart';
import 'package:ebook_online_read_ui/models/book.dart';
import 'package:ebook_online_read_ui/widgets/book_favorite.dart';
import 'package:ebook_online_read_ui/widgets/book_rating.dart';
import 'package:ebook_online_read_ui/widgets/maylike_book_card.dart';
import 'package:ebook_online_read_ui/widgets/rounded_btn.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Book book;
  const DetailsScreen({required this.book, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: size.height * .43,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * .09),
                        BookInfo(book: book)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: size.height * .4 - 30, bottom: 25),
                  child: Column(
                    children: [
                      ...book.chapter_num.map(
                        (chapter) => BookChapterCard(
                          chapterNumber: chapter + 1,
                          name: "Name of chapter",
                          tag: "Subtitle",
                          press: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      style: Theme.of(context).textTheme.headline5,
                      children: [
                        TextSpan(text: "You might also "),
                        TextSpan(
                          text: "like...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  MayLikeBookCard(book: books[0]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookChapterCard extends StatelessWidget {
  final String name;
  final String tag;
  final int chapterNumber;
  final Function press;
  const BookChapterCard({
    Key? key,
    required this.name,
    required this.tag,
    required this.chapterNumber,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 50,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            color: kShadowColor,
            blurRadius: 40,
          ),
        ],
      ),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Chapter $chapterNumber : $name\n",
                  style: TextStyle(
                    fontSize: 16,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "\t\t$tag",
                  style: TextStyle(
                    color: kLightBlackColor,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () => press(),
          ),
        ],
      ),
    );
  }
}

class BookInfo extends StatelessWidget {
  const BookInfo({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "${book.title}",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                            style: TextStyle(
                              fontSize: 12,
                              color: kLightBlackColor,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                          SizedBox(height: 10),
                          RoundedButton(
                            text: "Read",
                            paddVerti: 10,
                            press: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      BookFavorite(),
                      BookRating(rate: book.rate),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Hero(
          tag: 'book-image-${book.image}',
          child: Image.asset(
            "assets/images/${book.image}",
            height: 150,
          ),
        ),
      ],
    );
  }
}
