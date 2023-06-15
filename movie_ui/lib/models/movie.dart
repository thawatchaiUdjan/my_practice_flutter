// Our movie model
class Movie {
  final int id, year, numOfRatings, criticsReview, metascoreRating, time;
  final double rating;
  final List<String> genra;
  final String plot, title, poster, backdrop;
  final List<Map> cast;

  Movie({
    required this.poster,
    required this.backdrop,
    required this.title,
    required this.id,
    required this.year,
    required this.numOfRatings,
    required this.criticsReview,
    required this.metascoreRating,
    required this.time,
    required this.rating,
    required this.genra,
    required this.plot,
    required this.cast,
  });
}

// our demo data movie data
List<Movie> movies = [
  Movie(
    id: 1,
    title: "Aladin",
    year: 2019,
    poster: "assets/images/poster_1.jpg",
    backdrop: "assets/images/backdrop_1.jpg",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    metascoreRating: 76,
    time: 139,
    genra: ["Action", "Comedy", "Fantasy"],
    plot: plotText,
    cast: casts,
  ),
  Movie(
    id: 2,
    title: "Black Widow",
    year: 2021,
    poster: "assets/images/poster_2.jpg",
    backdrop: "assets/images/backdrop_2.jpg",
    numOfRatings: 190701,
    rating: 8.2,
    criticsReview: 50,
    metascoreRating: 76,
    time: 160,
    genra: ["Action", "Comedy", "Si-Fi"],
    plot: plotText,
    cast: casts,
  ),
  Movie(
    id: 3,
    title: "Rirouni Kenshin : The Final",
    year: 2021,
    poster: "assets/images/poster_3.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    numOfRatings: 241901,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    time: 125,
    genra: ["Action", "Drama"],
    plot: plotText,
    cast: casts,
  ),
];

var genres = [
  "Action",
  "Drama",
  "Comedy",
  "Fantasy",
  "Si-Fi",
];

var casts = [
  {
    "orginalName": "Kasumi Arimura",
    "movieName": "Tomoe Yukishiro",
    "image": "assets/images/actor_1.jpg",
  },
  {
    "orginalName": "Emi Takei",
    "movieName": "Kaoru Kamiya",
    "image": "assets/images/actor_4.jpg",
  },
  {
    "orginalName": "Scarlett Johansson",
    "movieName": "Natasha Romanoff",
    "image": "assets/images/actor_2.jpg",
  },
  {
    "orginalName": "Mena Massoud",
    "movieName": "Aladdin",
    "image": "assets/images/actor_3.jpg",
  },
];

String plotText =
    "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.";
