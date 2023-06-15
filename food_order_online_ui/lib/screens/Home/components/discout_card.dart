import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_online_ui/constants.dart';

class DiscoutCard extends StatelessWidget {
  const DiscoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Offers & Discouts",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            width: double.infinity,
            height: size.height * .23,
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage("assets/images/bg_main.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF6A8D01).withOpacity(.6),
                    kPrimaryColor.withOpacity(.4),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: SvgPicture.asset("assets/icons/macdonalds.svg"),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Get Discout of \n",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextSpan(
                              text: "30% \n",
                              style: TextStyle(
                                fontSize: 43,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "Lorem Ipsum is simply \ndummy text of the printing",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
