import 'package:flutter/material.dart';
import 'package:furniture_ui/constants.dart';
import 'package:furniture_ui/models/product.dart';
import 'package:furniture_ui/screens/Details/detail_screen.dart';
import 'package:furniture_ui/screens/Product/components/product_card.dart';

class TabViewCategory extends StatelessWidget {
  final TabController _tabCtrCategory;
  final List<String> _category;

  const TabViewCategory({
    Key? key,
    required TabController tabCtrCategory,
    required List<String> category,
  })  : _tabCtrCategory = tabCtrCategory,
        _category = category,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70),
                topRight: Radius.circular(70),
              ),
            ),
          ),
          TabBarView(
            controller: _tabCtrCategory,
            children: [
              ..._category.map((value) => buildListviewProductCard(value)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListviewProductCard(String category) {
    var selectedProd = category != "All"
        ? products.where((item) => item.category == category).toList()
        : products;
    return ListView.builder(
      padding: EdgeInsets.only(bottom: kDefaultPadding),
      itemCount: selectedProd.length,
      itemBuilder: (context, index) => ProductCard(
        product: selectedProd[index],
        indexOfView: index,
        onPress: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              product: selectedProd[index],
            ),
          ),
        ),
      ),
    );
  }
}
