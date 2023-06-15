class Book {
  final String image;
  final String title;
  final String auth;
  final double rate;
  final List<int> chapter_num;

  Book({
    required this.image,
    required this.title,
    required this.auth,
    required this.rate,
    required this.chapter_num,
  });
}

final List<Book> books = bookData
    .map((item) => Book(
          image: item['image'].toString(),
          title: item['title'].toString(),
          auth: item['auth'].toString(),
          rate: double.parse(item['rate'].toString()),
          chapter_num: List<int>.generate(
              int.parse(item['chapter_num'].toString()), (index) => index),
        ))
    .toList();

final bookData = [
  {
    "image": "book-1.png",
    "title": "Crushing & Influence",
    "auth": "Gary Venchunk",
    "rate": 4.5,
    "chapter_num": 5,
  },
  {
    "image": "book-2.png",
    "title": "Top 10 Business Hacks",
    "auth": "Herman Joel",
    "rate": 4.7,
    "chapter_num": 7,
  },
  {
    "image": "book-3.png",
    "title": "How to win friend & Influence People",
    "auth": "Robert Seling",
    "rate": 4.6,
    "chapter_num": 6,
  }
];
