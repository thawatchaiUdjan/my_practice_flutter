import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_order_online_ui/constants.dart';

class TitlePriceRating extends StatelessWidget {
  final String name;
  final double rating;
  final int reviews;
  final int price;

  const TitlePriceRating({
    Key? key,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: rating,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemSize: 20,
                      unratedColor: kSecondaryColor.withOpacity(.5),
                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(width: 10),
                    Text("${reviews} reviews"),
                  ],
                ),
              ],
            ),
          ),
          priceTag(context, price),
        ],
      ),
    );
  }

  ClipPath priceTag(BuildContext context, int price) {
    return ClipPath(
      clipper: PriceClipper(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        color: kPrimaryColor,
        alignment: Alignment.topCenter,
        width: 60,
        height: 60,
        child: Text(
          "\$${price}",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class PriceClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 15;

    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
