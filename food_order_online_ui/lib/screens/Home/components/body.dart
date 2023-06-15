import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_order_online_ui/components/search_box.dart';
import 'package:food_order_online_ui/constants.dart';
import 'package:food_order_online_ui/models/food.dart';
import 'package:food_order_online_ui/screens/Home/components/discout_card.dart';
import 'package:food_order_online_ui/screens/Home/components/food_card.dart';
import 'package:food_order_online_ui/screens/Home/components/tab_bar.dart';
import 'package:food_order_online_ui/screens/Home/components/tab_view.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late TabController _tabCtrCategory;
  late List<String> category;

  @override
  void initState() {
    super.initState();
    category = foodCtg;
    _tabCtrCategory = TabController(length: category.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(onChange: (value) {}),
        CategoryTabBar(tabController: _tabCtrCategory, category: category),
        CategoryView(tabController: _tabCtrCategory, category: category),
        DiscoutCard(),
      ],
    );
  }
}
