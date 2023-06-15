import 'package:flutter/material.dart';
import 'package:furniture2_ui/components/title_text.dart';
import 'package:furniture2_ui/models/Categories.dart';
import 'package:furniture2_ui/models/Product.dart';
import 'package:furniture2_ui/screens/home/components/category_list.dart';
import 'package:furniture2_ui/screens/home/components/recomment_list.dart';
import 'package:furniture2_ui/services/fetchCategory.dart';
import 'package:furniture2_ui/services/fetchProduct.dart';
import 'package:furniture2_ui/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(_defaultSize * 2),
              child: TitleText(title: "Browses by Category"),
            ),
            FutureBuilder(
              future: fetchCategory(),
              builder: (context, snapshot) => snapshot.hasData
                  ? CategoryList(categories: snapshot.data as List<Category>)
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: _defaultSize * 5),
                        child: Image.asset(
                          "assets/icons/loading_1.gif",
                          scale: _defaultSize / 1.5,
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: EdgeInsets.all(_defaultSize * 2),
              child: Divider(height: 8, thickness: 1),
            ),
            Padding(
              padding: EdgeInsets.all(_defaultSize * 2),
              child: TitleText(title: "Recommented for You"),
            ),
            FutureBuilder(
              future: fetchProduct(),
              builder: (context, snapshot) => snapshot.hasData
                  ? RecommentList(products: snapshot.data as List<Product>)
                  : Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: _defaultSize * 5),
                        child: Image.asset(
                          "assets/icons/loading_1.gif",
                          scale: _defaultSize / 1.5,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
