import 'package:ebook_online_read_ui/models/book.dart';
import 'package:ebook_online_read_ui/screens/details_screen.dart';
import 'package:ebook_online_read_ui/widgets/best_day_card.dart';
import 'package:ebook_online_read_ui/widgets/conti_read_card.dart';
import 'package:ebook_online_read_ui/widgets/reading_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/main_page_bg.png"),
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 50, bottom: 25),
                    child: Text.rich(
                      TextSpan(
                        style: Theme.of(context).textTheme.headline4,
                        children: [
                          TextSpan(text: "What are you\nreading "),
                          TextSpan(
                            text: "today?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 255,
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 20, right: 20),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: books.length,
                      itemBuilder: (context, index) => ReadingCard(
                        book: books[index],
                        pressDetail: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              book: books[index],
                            ),
                          ),
                        ),
                        pressRead: () {},
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Best of day
                        Text.rich(
                          TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: [
                              TextSpan(text: "Best of the "),
                              TextSpan(
                                text: "day",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        BestOfDayCard(book: books[2], size: size),
                        //Continue read
                        Text.rich(
                          TextSpan(
                            style: Theme.of(context).textTheme.headline5,
                            children: [
                              TextSpan(text: "Continue "),
                              TextSpan(
                                text: "reading...",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ContiReadCard(book: books[0], size: size),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
