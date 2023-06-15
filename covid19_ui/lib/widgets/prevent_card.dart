import 'package:covid19_ui/constants.dart';
import 'package:flutter/material.dart';

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String detail;
  const PreventCard({
    Key? key,
    required this.image,
    required this.title,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20, top: 25, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                blurRadius: 24,
              ),
            ],
          ),
        ),
        Positioned(
          top: 20,
          child: Image.asset(
            "assets/images/$image",
            height: 155,
          ),
        ),
        Positioned(
          top: 40,
          left: 130,
          child: Container(
            width: MediaQuery.of(context).size.width - 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kTitleTextStyle,
                ),
                SizedBox(height: 10),
                Text(
                  detail,
                  style: kSubTextStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
