import 'package:flutter/material.dart';
import 'package:furniture2_ui/components/sub_title_text.dart';
import 'package:furniture2_ui/components/title_text.dart';
import 'package:furniture2_ui/constants.dart';
import 'package:furniture2_ui/models/Categories.dart';
import 'package:furniture2_ui/size_config.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    Key? key,
    required Category category,
  })  : category = category,
        super(key: key);

  final Category category;
  double _defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(_defaultSize * 2),
      child: SizedBox(
        width: _defaultSize * 20.5,
        child: AspectRatio(
          aspectRatio: .8,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(),
              ClipPath(
                clipper: CategoryCustomClip(),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(_defaultSize * 2),
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(title: category.title),
                        SizedBox(height: _defaultSize),
                        SubTitleText(
                            title: "${category.numOfProducts}+ Products"),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.15,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/icons/loading_2.gif",
                    placeholderScale: _defaultSize * 0.05,
                    image: category.image,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    double width = size.width;
    double height = size.height;
    double cornerSize = 40;

    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);
    path.lineTo(cornerSize - 10, height * 0.15);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
