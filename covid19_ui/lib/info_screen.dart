import 'package:carousel_slider/carousel_slider.dart';
import 'package:covid19_ui/constants.dart';
import 'package:covid19_ui/widgets/my_header.dart';
import 'package:covid19_ui/widgets/prevent_card.dart';
import 'package:covid19_ui/widgets/symptom_card.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen>
    with SingleTickerProviderStateMixin {
  final CarouselController _CarouselController = CarouselController();
  final String detailPrevent =
      "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks";
  late final List<Widget> preventList;
  int _currCarousel = 0;

  @override
  void initState() {
    super.initState();
    preventList = [
      PreventCard(
        image: "wear-mask.png",
        title: "Wear face mask",
        detail: detailPrevent,
      ),
      PreventCard(
        image: "washhand.png",
        title: "Wash your hand",
        detail: detailPrevent,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          MyHeader(
            image: "doctor2.png",
            textTop: "Get to know",
            textBottom: "About Covid-19",
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Symptoms", style: kTitleTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SymptomCard(
                        image: "headache.png",
                        title: "Headache",
                        isActive: true,
                      ),
                      SymptomCard(image: "runny-nose.png", title: "Runny"),
                      SymptomCard(image: "sneeze.png", title: "Sneeze"),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text("Prevention", style: kTitleTextStyle),
                  Expanded(
                    child: CarouselSlider(
                      items: preventList,
                      carouselController: _CarouselController,
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currCarousel = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...preventList.asMap().entries.map((entry) => Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currCarousel == entry.key
                                ? kPrimaryColor
                                : kShadowColor.withOpacity(.5),
                          ))),
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
