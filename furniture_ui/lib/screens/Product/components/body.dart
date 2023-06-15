import 'package:flutter/material.dart';
import 'package:furniture_ui/components/search_box.dart';
import 'package:furniture_ui/constants.dart';
import 'package:furniture_ui/models/product.dart';
import 'package:furniture_ui/screens/Product/components/tab_bar.dart';
import 'package:furniture_ui/screens/Product/components/tab_view.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late TabController _tabCtrCategory;

  @override
  void initState() {
    super.initState();
    _tabCtrCategory = TabController(length: Category.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(onChange: (value) {}),
        TabBarCategory(tabCtrCategory: _tabCtrCategory, category: Category),
        TabViewCategory(tabCtrCategory: _tabCtrCategory, category: Category),
      ],
    );
  }
}
